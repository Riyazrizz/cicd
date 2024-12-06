# Ansible Playbook for Docker Installation

## Prerequisites
1. Ansible installed on your local machine.
2. The IP address of the EC2 instance created in Task 1.
3. SSH access to the EC2 instance using your key pair.

## Setup Instructions

1. **Update Inventory**:
   - Open `inventory.ini` and replace `<instance_public_ip>` with the actual public IP of your EC2 instance.
   - Ensure the SSH key path is correct in `inventory.ini`.

2. **Run the Playbook**:
   - Use the following command to execute the playbook:
     ```bash
     ansible-playbook -i inventory.ini install_docker.yml
     ```

3. **Verify Docker Installation**:
   - Once the playbook completes, log into the EC2 instance:
     ```bash
     ssh -i /path/to/your-key.pem ec2-user@<instance_public_ip>
     ```
   - Run `docker --version` to verify Docker is installed and running.

## Notes
- The playbook supports both Ubuntu-based and Amazon Linux systems.
- If running on a different Linux distribution, adjust package management tasks as needed.
