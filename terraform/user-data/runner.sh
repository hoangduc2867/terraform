#!/bin/bash
# Add the GitLab repository
curl -L "https://packages.gitlab.com/install/repositories/runner/gitlab-runner/script.rpm.sh" | sudo bash

# Install GitLab Runners
sudo yum install -y gitlab-runner

# enable
sudo systemctl enable gitlab-runner
sudo systemctl start gitlab-runner