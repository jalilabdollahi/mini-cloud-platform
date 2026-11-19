# Learning journal
This journal is for showing how the process goes and it is to document what I have learned from each lesson

## 2026-11-17 — 00-setup/01-workspace
**Lesson:** Your workspace, the mentor, and a safe kube environment
**What I built:** 
In this step created the repo and installed kind and other requirements. 
Also made some shortcuts in my terminal. k instead of kubectl, g > git
**What I learned:** 
As allways, we need to make repos safe and protect other clusters from the changes in 3 a.m!
**Challenges:**
Docker had only 8 GB memory → raised it to 16 GB in Docker Desktop settings.
**Next:**
creating the repo and prepration of the repo

## 2026-11-18 — 00-setup/02-project-repo
**Lesson:** Your public project repository 
**What I built:**
Added .gitignore 
Also defined commit rules. 
**What I learned:** 
I have not used these flags before:
git commit --amend
It is good to commit each change before going to the next step.
This flag is used to check gitignore state: git check-ignore -v
**Challenges:**
git check-ignore -v and git branch -m
gitignore was not covering sensitive files, solved by adding * 
**Next:** 
prepare the Kind cluster creation

## 2026-11-18 — 00-setup/03-kind-cluster
**Lesson:** A local kind cluster with Makefile targets
**What I built:** 
Add kind-config with mounting docker.sock for next API usages
Also added cluster-up and cluster-down to makefile.

**What I learned:** 
learned adding if statement to makefile
also practiced Idempotency method implementation

**Challenges:**
PHONY section in make file and method calls
TAB indention

**Next:** 
Creating Operator

<!--
## YYYY-MM-DD — <lesson id>
**Lesson:** 
**What I built:** 
**What I learned:** 
**Challenges:**
**Next:** 
-->