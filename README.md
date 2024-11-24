# Giải thích về triển khai cicd code terraform:
+ trong file .gitlab-ci.yml có các biến "$AWS_ACCESS_KEY_ID,$AWS_SECRET_ACCESS_KEY,$AWS_DEFAULT_REGION"
+ Variable của các biến này được truyền vào Settings -> CI / CD  trong GitLab repository
+ khí có update repository chứa code terraform thì cicd tự đông deploy

# Giải thích về source code terraform:
1: Theo yêu cầu đề thì đã triển khai:
+ ACM,router53 cho triển khai domain
+ VPC triển khai các service trong vpc
+ Triển khai ECS
+ Triển khai LB.
2: ngoài yêu cầu thì source có triển khai thêm các service dưới:
+ Có server bastion để làm tính năng security.
+ Có server làm gitlab runner 
+ có server be
+ có cloudfont
+ Có server db
+ Có server làm monitor