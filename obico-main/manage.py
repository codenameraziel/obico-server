#!/usr/bin/env python3
import os
import sys

def main():
    """Ponto de entrada para comandos administrativos do Django."""
    os.environ.setdefault('DJANGO_SETTINGS_MODULE', 'obico.settings')
    try:
        from django.core.management import execute_from_command_line
    except ImportError as exc:
        raise ImportError(
            "Não foi possível importar Django. Está instalado?"
        ) from exc
    execute_from_command_line(sys.argv)

if __name__ == '__main__':
    main()
