.PHONY: guard cluster-up cluster-down
guard:
ifneq ($(KUBECONFIG),$(MENTOR_HOME)/.kube/config)
	$(error KUBECONFIG is '$(KUBECONFIG)', expected '$(MENTOR_HOME)/.kube/config')
endif
cluster-up: guard
	@echo "Starting cluster..."
	kind create cluster --config hack/kind-config.yaml --name mentor --wait 5m
cluster-down: guard
	@echo "Stopping cluster..."
	kind delete cluster --name mentor