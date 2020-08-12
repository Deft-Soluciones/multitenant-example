import uuid

from django.db import models
from tenant_schemas.models import TenantMixin


class Client(TenantMixin):
    id = models.UUIDField(primary_key=True, default=uuid.uuid4, editable=False)

    name = models.CharField(max_length=100)
    created = models.DateTimeField(auto_now_add=True)
