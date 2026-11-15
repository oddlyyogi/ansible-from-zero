#!/usr/bin/env python3
import json
inventory = {
    "webservers": {"hosts": ["web1", "web2"]},
    "_meta": {"hostvars": {"web1": {"ansible_port": 2222},
                           "web2": {"ansible_port": 2223}}},
}
print(json.dumps(inventory))