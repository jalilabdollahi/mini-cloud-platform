# mini-cloud-platform

A small, self-service cloud platform built on Kubernetes. You ask for a tenant through a
REST API, and an operator gives you a ready namespace with quotas, RBAC and network rules.
Later, the same flow creates whole Kubernetes clusters on OpenStack with Cluster API.

## Why I built this
I'm moving into platform engineering, and I wanted to build the real thing instead of just
reading about it. This repo is where I learn Go, operators and Cluster API step by step.

## How it fits together
- platform-api (Go, REST): the front door; it creates Tenant objects
- tenant operator (Go, kubebuilder): turns a Tenant into Namespace, ResourceQuota, RBAC, NetworkPolicy
- Cluster API: creates clusters for a TenantCluster (Docker locally, OpenStack for real)
- GitOps: Argo CD and Kustomize deploy everything from this repo

## Status
Work in progress. I commit as I learn, so the history shows how it grows.

## License
Apache-2.0