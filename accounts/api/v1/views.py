from allauth.socialaccount.providers.google.views import GoogleOAuth2Adapter
from allauth.socialaccount.providers.oauth2.client import OAuth2Client
from rest_framework import status
from rest_framework.authtoken.models import Token
from rest_framework.exceptions import ValidationError
from rest_framework.generics import GenericAPIView
from rest_framework.response import Response

from accounts.api.v1.serializers import SignInSerializer, SignUpSerializer, UserSerializer, SocialLoginSerializer


class SignInAPIView(GenericAPIView):
    serializer_class = SignInSerializer

    def post(self, request, *args, **kwargs):
        serializer = self.get_serializer(data=request.data)
        serializer.is_valid(raise_exception=True)

        user = serializer.validated_data.get('user')
        token, _ = Token.objects.get_or_create(user=user)

        user_serializer = UserSerializer(user)

        response = user_serializer.data
        response['token'] = token.key

        return Response(response, status=status.HTTP_200_OK)


class SignUpAPIView(GenericAPIView):
    serializer_class = SignUpSerializer

    def post(self, request, *args, **kwargs):
        serializer = self.get_serializer(data=request.data)
        serializer.is_valid(raise_exception=True)

        token, user = serializer.save()
        user_serializer = UserSerializer(user)

        response = user_serializer.data
        response['token'] = token.key

        return Response(response, status=status.HTTP_201_CREATED)


class AbstractBaseLoginView(GenericAPIView):
    authentication_classes = []

    class Meta:
        abstract = True

    def post(self, request, *args, **kwargs):
        serializer = self.get_serializer(data=request.data)
        if not serializer.is_valid():
            raise ValidationError(serializer.errors)

        user = serializer.validated_data.get('user')
        created = serializer.validated_data.get('created')

        """ If new user, create student and teacher object for the user """
        if created:
            pass

        user_serializer = UserSerializer(instance=user, context={'request': request})
        token, _ = Token.objects.get_or_create(user=user)

        response = user_serializer.data
        response['token'] = token.key

        return Response(response, status=status.HTTP_200_OK)


class GoogleLoginView(AbstractBaseLoginView):
    serializer_class = SocialLoginSerializer
    adapter_class = GoogleOAuth2Adapter
    client_class = OAuth2Client

