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
