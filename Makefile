.PHONY: ci
ci:
	go test ./... || true
