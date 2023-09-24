copilot init --app cloudday --dockerfile svc-api-markdown/Dockerfile --name svc-api-markdown --type  "Load Balanced Web Service"
copilot env init --name staging --default-config --profile default
copilot storage init -t DynamoDB -n markdown-table --partition-key ID:S --no-lsi --no-sort -w svc-api-markdown
copilot env deploy --name staging
copilot svc deploy --name svc-api-markdown --env staging
copilot svc show --name svc-api-markdown
curl -X POST http://cloud-Publi-1UPGAOLZG45YU-2020411806.ap-southeast-1.elb.amazonaws.com/api/markdown/process -d '{"text":"# Hello world from AWS Copilot!"}' --header "Content-type: application/json"
-----
copilot pipeline init --name cloudday --url https://github.com/jazst21/cloudday-container.git --git-branch main --environments staging --pipeline-type Workloads
git add copilot/
git commit -m "Add copilot files"
git push -u origin main
copilot pipeline deploy
cat "Hello pipeline!" > test-pipeline
copilot pipeline status
-----
copilot pipeline delete --delete-secret --name cloudday
copilot svc delete svc-api-markdown
copilot env delete production
copilot env delete staging
copilot app delete cloudday
----
echo "# cloudday-container" >> README.md
git init
git add README.md
git commit -m "first commit"
git branch -M main
git remote add origin https://github.com/jazst21/cloudday-container.git
git push -u origin main