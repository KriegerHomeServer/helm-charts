### Resources Created
| Kind                       | Name                                          | Description                                                                                              |
| -------------------------- | --------------------------------------------- | -------------------------------------------------------------------------------------------------------- |
| `CustomResourceDefinition` | <span>dnsmappings.blocky.io</span>            | CRD providing a resource other charts can create to define custom DNS mappings                           |
| `ClusterRole`              | read-dnsmappings                              | Allows cluster-wide read access to DnsMappings                                                           |
| `Role`                     | read-write-configmaps                         | Allows namespaced read and write access to ConfigMaps                                                    |
| `Role`                     | rollout-restart-deployments                   | Allows namespaced access to perform rollout restarts against Deployments                                 |
| `ServiceAccount`           | blocky-cronjob-sa                             | Service Account used by the `update-blocky-dns-mappings-job` CronJob                                     |
| `ClusterRoleBinding`       | blocky-cronjob-sa-read-dnsmappings            | Bind the `blocky-cronjob-sa` Service Account and the `read-dnsmappings` ClusterRole                      |
| `RoleBinding`              | blocky-cronjob-sa-read-write-configmaps       | Bind the `blocky-cronjob-sa` Service Account and the `read-write-configmaps` Role                        |
| `RoleBinding`              | blocky-cronjob-sa-rollout-restart-deployments | Bind the `blocky-cronjob-sa` Service Account and the `rollout-restart-deployments` Role                  |
| `ConfigMap`                | blocky-configuration                          | ConfigMap containing Blocky configuration                                                                |
| `Deployment`               | blocky                                        | Deployment that manages the Blocky app                                                                   |
| `Service`                  | blocky-service                                | Service for the `blocky` Deployment                                                                      |
| `CronJob`                  | update-blocky-dns-mappings-job                | CronJob that updates the `blocky-configuration` ConfigMap with values discovered in DnsMapping resources |

### Parameters
|               Parameter                |                                        Description                                        |                             Default Value                              |
| :------------------------------------: | :---------------------------------------------------------------------------------------: | :--------------------------------------------------------------------: |
|          `config.blockLists`           |                     List of urls containing lists of domains to block                     | `['https://raw.githubusercontent.com/StevenBlack/hosts/master/hosts']` |
|      `config.upstreamDnsServers`       |       List of hosts or ip addresses of upstream DNS servers to answer requests with       |                        `['8.8.8.8','8.8.4.4']`                         |
|       `cronjob.image.pullPolicy`       |                               The image pull policy to use                                |                            `"IfNotPresent"`                            |
|       `cronjob.image.repository`       |                     The repository to fetch the container image from                      |                       `teegank/kubernetes-utils`                       |
|          `cronjob.image.tag`           |                          The tag of the container image to fetch                          |                                `latest`                                |
|           `cronjob.schedule`           | Cron String that informs the frequency at which the `update-blocky-dns-mappings-job` runs |                            `"*/5 * * * *"`                             |
|         `deployment.httpPort`          |                       Port number to use internally for the web ui                        |                                 `4000`                                 |
|     `deployment.image.pullPolicy`      |                               The image pull policy to use                                |                            `"IfNotPresent"`                            |
|     `deployment.image.repository`      |                     The repository to fetch the container image from                      |                            `"spx01/blocky"`                            |
|         `deployment.image.tag`         |                          The tag of the container image to fetch                          |                               `"latest"`                               |
|       `deployment.replicaCount`        |                                    Number of replicas                                     |                                  `1`                                   |
|   `deployment.resources.limits.cpu`    |                               The limit for cpu allocation                                |                                `"100m"`                                |
|  `deployment.resources.limits.memory`  |                              The limit for memory allocation                              |                               `"128Mi"`                                |
|  `deployment.resources.requests.cpu`   |                          The initial request for cpu allocation                           |                                `"50m"`                                 |
| `deployment.resources.requests.memory` |                         The initial request for memory allocation                         |                                `"64Mi"`                                |
|      `dnsMappings.portal.domain`       |                         The domain for the web portal DNS mapping                         |                            `"blocky.local"`                            |
|         `dnsMappings.custom[]`         |                              A list of DNS mappings to apply                              |                                  `[]`                                  |
|      `dnsMappings.custom[*].name`      |                                 The name of a DNS mapping                                 |                                  `""`                                  |
|     `dnsMappings.custom[*].domain`     |                                The domain of a DNS mapping                                |                                  `""`                                  |
|       `dnsMappings.custom[*].ip`       |                                  The ip of a DNS mapping                                  |                                  `""`                                  |
|        `service.loadBalancerIP`        |                     The IP address to requests from the load balancer                     |                                  `""`                                  |
|           `traefik.enabled`            |                  Set whether the traefik ingress route should be enabled                  |                                `false`                                 |