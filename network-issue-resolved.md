To generate the `network-issue-resolved.md` file with your AKS issue documentation, you’ll need to log in to ChatGPT to use the Python tool. However, here’s the code you can run locally using Python:

````python
from pathlib import Path

markdown_content = """
# 🛠️ Issue: AKS Pods Cannot Communicate with External Services

## 🔍 Symptoms
- Pods were unable to reach external URLs (e.g., `curl https://google.com` fails).
- DNS resolution inside pods failed (`nslookup` and `ping` did not resolve).
- `kubectl logs` showed application timeouts on external API calls.

---

## 📄 Root Cause
- The cluster was deployed with **Azure CNI**, and there was:
  - **No outbound route to the internet**.
  - A **User-Defined Route (UDR)** was configured but lacked a rule for `0.0.0.0/0` to NAT gateway/internet.
  - NSG was **blocking port 53 (DNS)** and 443 (HTTPS) outbound.

---

## ✅ Resolution Steps

### 1. Checked DNS resolution
```bash
kubectl exec -it <pod> -- nslookup google.com
````

> ❌ Result: `Server failed` or timeout

### 2. Verified CoreDNS Logs

```bash
kubectl logs -n kube-system -l k8s-app=kube-dns
```

> ✅ CoreDNS running but unable to resolve names externally.

### 3. Checked Pod Routing and UDR

* Found no route in UDR for external access (`0.0.0.0/0`).
* Added outbound route via Azure NAT Gateway.

### 4. Modified NSG Rules

* Allowed **Outbound TCP on ports 53 (DNS), 80, 443**.

### 5. Tested from Busybox Pod

```bash
kubectl run -it busybox --image=busybox --restart=Never -- sh
wget https://google.com
```

> ✅ Success

---

## 📁 Attached Logs

* `kubectl describe pod <pod>`: shows pending DNS or failed egress connections.
* `kubectl logs <pod>`: application logs showing connection timeouts.
* `kubectl logs -n kube-system -l k8s-app=kube-dns`: CoreDNS behavior.
  """

file\_path = Path("network-issue-resolved.md")
file\_path.write\_text(markdown\_content.strip())
print(f"Markdown file created: {file\_path}")

```
