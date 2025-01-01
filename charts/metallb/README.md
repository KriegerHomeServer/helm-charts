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

### Parameters
| Parameter                       | Description                                                    | Default Value |
| ------------------------------- | -------------------------------------------------------------- | ------------- |
| `ipAddressPools[]`              | A list of IP address pools to create                           | `[]`          |
| `ipAddressPools[*].name`        | The name of the IP address pool to create                      | `""`          |
| `ipAddressPools[*].addresses[]` | A list of IP addresses or IP address ranges to add to the pool | `[]`          |
