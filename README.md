


## 🖥️ System Health Monitoring Script

A lightweight **Bash-based system monitor** that tracks CPU, memory, disk, and network usage.  
The project evolves through phases, adding real-world DevOps functionality.

---

##  Phase 1 — Basic Monitoring

**File:** `system-health.sh`  
Displays key system stats like CPU, memory, disk, uptime, users, and network info in a color-formatted CLI output.

**Run:**
```bash
chmod +x system-health.sh
./system-health.sh
````

**Sample Output:**

```
CPU Usage: 12.7%
Memory Usage: 43.2%
Disk Usage: 71%
Uptime: up 3 hours, 27 minutes
```

---

##  Phase 2 — Logging & Threshold Alerts

**File:** `system-healthv2.sh`
Adds persistent logging and alerts when CPU, memory, or disk usage exceed set limits.

**Features:**

* Logs system metrics to a file
* Alerts for high resource usage
* Configurable log path (`$(pwd)/sys_health.log`)

**Run:**

```bash
chmod +x system-healthv2.sh
./system-healthv2.sh
```

**Example:**

```
[2025-11-05 11:30:46] CPU: 14.3% | MEM: 47.9% | DISK: 68%
⚠️ High Memory Usage: 89.5%
```

---

##  Next Phase (Planned)

* Graphical visualization using `gnuplot`
* CSV data logging
* HTML dashboard integration

---


