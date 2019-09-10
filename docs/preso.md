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
| Datadog Application Key  | Needed to submit data to Datadog |
| Terraform  | for automatically configuring the Datadog dashboards and metadata |
| Ansible  | (optional) for automatically configuring the Datadog agent |
| | |
</small>
