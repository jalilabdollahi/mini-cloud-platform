# Architecture
```
  User
    │  POST /v1/tenants
    ▼
┌──────────────┐   creates    ┌──────────────┐
│ platform-api │ ───────────► │ Tenant (CR)  │
│  (Go, REST)  │              └──────┬───────┘
└──────────────┘                     │ watch
                                     ▼
                           ┌───────────────────┐  creates   Namespace, ResourceQuota,
                           │  tenant-operator  │ ─────────► RoleBindings, NetworkPolicy
                           │ (Go, kubebuilder) │
                           └─────────┬─────────┘
                                     │ creates Cluster (planned)
                                     ▼
                           ┌───────────────────┐  creates   VMs, networks,
                           │    Cluster API    │ ─────────► load balancers
                           │      + CAPO       │            in OpenStack
                           └───────────────────┘

  Git ──► Argo CD ──► deploys all components to the management cluster (GitOps)
```

**Goal**:
This repo is to create a fully automated platform to create desired resources in K8s.

**Components**:
1. *Platform-api*: Converts incoming HTTP request to a kubernetes object (a TENANT)
2. *Tenant*: Is a custom resource which we add to Kubernetes.
3. *Tenant-operator*: Creates Namespace, ResourceQuota, RoleBindings, NetworkPolicy in management cluster
4. *Cluster API + CAPO*: CAPO stands for Cluster API Provider OpenStack, this creates VMs, networks, loadbalancers in OpenStack

**Data flow**: 
* User calls the platform-API using Go application
* The application creates tenants which are Custom Resources.
* Then the tenant operator creates all requested resources for the CR
* The final step is to create the Cluster and VMs, and other resources 
* The source is kept in Github as a source of truth. Once a change is made in repo, ArgoCD gets notified and deploys the changes into the cluster.