# Azure Cost Optimization Recommendations


This document summarizes cost-saving opportunities and optimization strategies for Azure resources, based on Azure Advisor insights and best practices.

---

## Common Cost-Saving Recommendations

| Resource Type        | Advisor Finding                   | Proposed Optimization                                   |
|----------------------|---------------------------------|--------------------------------------------------------|
| **Virtual Machines**  | Low CPU utilization (< 20%)      | Resize to smaller SKU or schedule shutdowns during off-hours |
|                      | Running 24/7 but idle            | Implement auto-shutdown during non-business hours       |
| **App Services**      | Low traffic or underutilized plans| Scale down App Service Plan (e.g., from Standard to Basic) |
| **SQL Databases**     | Overprovisioned DTUs or vCores  | Adjust performance tier or use serverless compute tier  |
| **Storage**           | Unattached managed disks        | Delete unattached disks to reduce storage costs          |
| **Public IP Addresses**| Idle or unused IPs               | Release unused public IP addresses                        |
| **Cosmos DB**         | Overprovisioned throughput      | Lower provisioned throughput or enable autoscale         |
| **Reserved Instances**| No RI purchase                  | Purchase Reserved Instances for consistent workloads to save up to 72% |

---

## Additional Best Practices

- **Implement Auto-Scaling:**  
  Automatically scale resources based on demand to optimize cost and performance.

- **Schedule Shutdowns for Non-Critical Resources:**  
  Use automation to shut down VMs and other resources during off-hours.

- **Use Spot VMs:**  
  For interruptible workloads, leverage Spot VMs to reduce compute costs.

- **Leverage Azure Hybrid Benefit:**  
  Apply existing Windows Server and SQL Server licenses to reduce licensing costs.

- **Right-Size Resources Periodically:**  
  Regularly review resource utilization and adjust sizing accordingly.

---

## How to Use Azure Advisor for Cost Savings

1. Navigate to **Azure Advisor** in the Azure Portal.  
2. Select the **Cost** category to filter cost optimization recommendations.  
3. Review personalized recommendations for your subscription.  
4. Implement recommended optimizations based on workload requirements and business priorities.

---

## Example Optimization Plan

| Resource                 | Recommendation                    | Action                                   |
|--------------------------|---------------------------------|------------------------------------------|
| VM: `prod-webserver-01`  | Low CPU usage                   | Resize from Standard_D4s_v3 to Standard_D2s_v3 |
| SQL DB: `orders-db`       | Overprovisioned DTUs           | Switch to serverless compute tier         |
| Storage Account: `logs`   | Unattached disks               | Delete unattached disks                    |
| App Service Plan: `api-plan` | Underutilized                 | Scale down plan from Standard to Basic    |
| Public IP: `pip-test`     | Idle                          | Release unused public IP                   |

---

## References

- [Azure Advisor Documentation](https://docs.microsoft.com/en-us/azure/advisor/advisor-cost-recommendations)  
- [Azure Cost Management and Billing](https://azure.microsoft.com/en-us/services/cost-management/)  
- [Azure Hybrid Benefit](https://azure.microsoft.com/en-us/pricing/hybrid-benefit/)  

---
