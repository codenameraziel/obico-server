from django.contrib import admin
from django.urls import path, include

urlpatterns = [
    path("admin/", admin.site.urls),

    # Rotas de autenticação
    path("accounts/", include("django.contrib.auth.urls")),
    path("accounts/", include("accounts.urls")),

    # Rotas dos apps principais
    path("printers/", include("printers.urls")),
    path("jobs/", include("jobs.urls")),
    path("notifications/", include("notifications.urls")),
    path("streaming/", include("streaming.urls")),
]
