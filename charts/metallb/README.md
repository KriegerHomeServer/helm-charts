# MetalLB Helm Chart

### Dependencies

| Name      | Repository                           | Version  |
| --------- | ------------------------------------ | -------- |
| `metallb` | `https://metallb.github.io/metallb/` | `0.14.9` |

### Resources Created

| Kind              | Name                  | Optional   | Description                                                                          |
| ----------------- | --------------------- | ---------- | ------------------------------------------------------------------------------------ |
| `IPAddressPool`   | User Defined          | `OPTIONAL` | Zero or more IPAddressPools defining IPs available for MetalLB to assign services to |
| `L2Advertisement` | metallb-advertisement | `OPTIONAL` | L2Advertisement advertising the defined IPAddressPools                               |
| `DNSMapping`      | metallb               | `OPTIONAL` | Resource defining a DNS mapping to add to the Blocky configuration                   |

### Parameters
| Parameter                       | Description                                                    | Default Value |
| ------------------------------- | -------------------------------------------------------------- | ------------- |
| `blocky.enabled`                | Create Blocky resources                                        | `false`       |
| `blocky.dnsMapping.domain`      | Domain to use when creating the DNS mapping                    | `""`          |
| `blocky.dnsMapping.subdomain`   | Subdomain to use when creating the DNS mapping                 | `""`          |
| `blocky.dnsMapping.ip`          | IP address to use when creating the DNS mapping                | `""`          |
| `ipAddressPools[]`              | A list of IP address pools to create                           | `[]`          |
| `ipAddressPools[*].name`        | The name of the IP address pool to create                      | `""`          |
| `ipAddressPools[*].addresses[]` | A list of IP addresses or IP address ranges to add to the pool | `[]`          |
