# invidious
Invidious is an alternative front-end to YouTube

Tags: Ansible, Podman, Podman Quadlets

## Notes

1. Initial setup (one-time steps)

        # Create linux user
        ansible-playbook create-service-user.yaml
        ansible-playbook delete-service-user.yaml

        # Create ssh login for this user

        # Periodic rotation
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

3. Operations (multi-time steps)
   

