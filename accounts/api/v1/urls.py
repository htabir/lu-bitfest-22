from django.urls import path

from accounts.api.v1.views import SignInAPIView, SignUpAPIView, GoogleLoginView

try:
    from allauth.socialaccount import providers
except ImportError:
    raise ImportError("allauth needs to be added to INSTALLED_APPS.")

app_name = 'accounts-api-v1'
urlpatterns = [
    path('signin/', SignInAPIView.as_view(), name='sign-in'),
    path('signup/', SignUpAPIView.as_view(), name='sign-up'),
    path('login/google/', GoogleLoginView.as_view(), name="google-login"),
]
