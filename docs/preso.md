---
theme : "night"
transition: "convex"
highlightTheme: "darkula"
logoImg: "redis-labs-header.png"
slideNumber: true
---

## Monitoring Redis Enterprise with DataDog

### 09/13/2019

<small>Presented by [Chris Mague](mailto:christian@redislabs.com)</small>

---

## Agenda
* End Goal
* Prerequisites
* Configuring Datadog for Programatic Access
* Setting up Datadog Agent
* Collecting data from Redis Enterprise
* Configuring Metadata
* Building dashboards
* What we're graphing
* What we're monitoring
* Future

---

### Questions we want to answer
<br>

- How full are my databases?
- What's the latency of my queries?
- Are clients connected?
- Are keys being evicted from my database?

---

<img src="datadog_dashboard.png"style="background:none; border:none; box-shadow:none;"> 

---

<img src="datadog_monitors.png"style="background:none; border:none; box-shadow:none;"> 

---

<img src="diagram.png"style="background:none; border:none; box-shadow:none;"> 

---

## Prerequisites
<small>

| Requirement  | Usage |
|---------------|-----------|
| Datadog API Key  | Needed to send data to Datadog |
| Datadog Application Key  | Needed to create dashboards and alerts |
| Terraform  | for automatically configuring the Datadog dashboards and metadata |
| Ansible  | (optional) for automatically configuring the Datadog agent |
| | |
</small>


---

## Datadog Config

<br>
We need to create API and Application keys for programatic access

[https://app.datadoghq.com/account/settings#api](https://app.datadoghq.com/account/settings#api)

---

## Datadog Config

<img src="datadog_key_setup.png" style="background:none; border:none; box-shadow:none;"> 

---

### Setting up the Datdog Agent
<br>

- The datadog agent needs to be installed on a node preferably outside of the cluster
- Can be done [manually with a bash script](https://app.datadoghq.com/account/settings#agent)
- Also automated via [Ansible](https://github.com/DataDog/ansible-datadog), [Puppet](https://github.com/DataDog/puppet-datadog-agent) or [Chef](https://github.com/DataDog/chef-datadog)

---

### Datadog Config with Ansible

<img src="ansible_agent_playbook.png" style="background:none; border:none; box-shadow:none;"> 

---

### Datadog agent

<small>
- Configuration files
    - /etc/datadog-agent/datadog.yaml (main config - contains API key)
    - /etc/datadog-agent/conf.d/ (integrations)

- Processes
    - stop: sudo systemctl stop datadog-agent
    - start: sudo systemctl start datadog-agent
    - status: sudo systemctl status datadog-agent
</small>

---

#### Collecting Data from Redis Enterprise Manually

<small>
- Configuration files
    - /etc/datadog-agent/conf.d/prometheus.d/conf.yaml

- Processes
    - restart: sudo systemctl restart datadog-agent
</small>

---

#### Collecting Data from Redis Enterprise Automated

<img src="ansible_prom_playbook.png" style="background:none; border:none; box-shadow:none;"> 

<small>
Template is available for download [here](https://github.com/Redislabs-Solution-Architects/RE-Datadog-Vagrant/blob/master/ansible/templates/prometheus_conf.yaml.j2)
</small>