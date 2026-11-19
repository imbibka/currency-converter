# Currency Converter API

## How to run
./scripts/run.sh

## How to test
./scripts/test.sh

## Rollback

Argo CD deploys the application from the main branch.

If a new version has a problem, I can roll back using Git:

1. Find the commit that changed the image:
   git log --oneline -- k8s/deployment.yaml

2. Revert that commit:
   git revert <commit>

3. Push the change:
   git push origin main

Argo CD detects the change in Git and deploys the previous version automatically.
