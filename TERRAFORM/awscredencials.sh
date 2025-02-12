tee /tmp/setup-ec2.sh << EOT
sudo snap install aws-cli --classic
sudo snap install terraform --classic
terraform -install-autocomplete
export TF_PLUGIN_CACHE_DIR="$HOME/.terraform.d/plugin-cache"
grep TF_PLUGIN_CACHE_DIR ~/.bashrc || echo 'export TF_PLUGIN_CACHE_DIR="$HOME/.terraform.d/plugin-cache"' >> ~/.bashrc
EOT
source  /tmp/setup-ec2.sh

--------------------------------------


tee /tmp/setup-creds.sh << EOT
aws configure set region us-east-1 --profile default
aws configure set output json --profile default
aws configure set aws_access_key_id CHANGEME --profile default
aws configure set aws_secret_access_key CHANGEMETOO --profile default
aws configure set cli_pager "" --profile default
aws configure set cli_history enabled
EOT
source /tmp/setup-creds.sh

--------------------------------------------

sudo nano ~/.aws/credentials

--------------------------------------------

mkdir Documents
cd Documents
sudo apt install git
git clone https://github.com/joaniznardo/asixcloud2024
cd asixcloud2024

-------------------------------------------------
