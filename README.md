# invidious
Invidious is an alternative front-end to YouTube

Tags: Ansible, Podman, Podman Quadlets

## Notes

    # Periodic credentials rotation
    vault write database/roles/<role-name> rotation_period=1h

    # Ansible playbook
    ---
    - name: Configure rotation_period for Vault database role
      hosts: localhost
      tasks:
        - name: Write rotation_period for database role
          hashivault_secret_backend:
            backend: database
            role: <role-name>
            state: present
            rotation_period: 1h
