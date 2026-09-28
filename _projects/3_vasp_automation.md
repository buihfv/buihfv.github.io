---
layout: page
title: Monitoring and Logging Tools for Multi-Server VASP Calculations
description: Bash tooling that shows who is using which GPU, blocks conflicting submissions, and reports every finished run to Sheets and Telegram.
img: assets/img/project_vasp_automation.jpg
importance: 1
category: work
related_publications: false
---

**July 2026 – September 2026**

## Overview

A Bash resource monitor reporting per-GPU utilization and per-user job allocation on a shared Linux server, job launchers that check GPU and core availability and flag conflicts before a VASP run starts, and automated result logging that parses VASP output for convergence, energy and run settings and pushes it to Google Sheets and Telegram over REST APIs, across three compute servers.

## Motivation

The group's calculations run on servers, one of them a shared external GPU server with no scheduler in front of it. That left two blind spots at opposite ends of a job's life.

Before submitting, there was no way to see whether the GPUs were already saturated or by whom — `nvidia-smi` reports processes, not people, so a PID told you nothing about whose calculation it belonged to. Members submitted into a full machine, everyone's jobs slowed down, and the cause was invisible.

After a run, the outcome sat in a directory nobody was watching. A job that had died at step three looked exactly like one still working, and a converged result months later carried no record of the settings that produced it.

## Approach

<div class="media-row media-wide">
<div class="media-col">
<figure>
  <img src="{{ '/assets/img/vasp_gpu_status.jpg' | relative_url }}" alt="resource_status output showing per-GPU load and per-user job allocation">
  <figcaption><code>resource_status</code>: per-GPU load and free memory, then every running calculation grouped by user and directory.</figcaption>
</figure>
<figure>
  <img src="{{ '/assets/img/vasp_cpu_status.jpg' | relative_url }}" alt="CPU availability section of the same report">
  <figcaption>The same pass reports free cpu cores and every running calculation grouped by user and directory.</figcaption>
</figure>
</div>
<div class="media-text" markdown="1">
**`resource_status` — turning PIDs into people.** For each compute process the script resolves `/proc/<pid>/cwd`, extracts the owning user from the path, and groups every allocation by user and by calculation directory. The output is per-GPU utilization and free memory with an OK/insufficient flag against a 15 GB threshold, then a per-user breakdown showing which GPUs each calculation holds.

The script also covers CPU occupancy, and prints the safe way to stop a job — identify the parent PID through `/proc/<pid>/cmd` and kill that, never a pattern match, which on a shared machine would take down other people's runs along with your own. (I killed everyone's calculations...It was my big mistake in 2026)
</div>
</div>

<div class="media-row">
<div class="media-col">
<figure>
  <img src="{{ '/assets/img/vasp_submit_check.jpg' | relative_url }}" alt="Submission commands for GPU and CPU VASP runs">
  <figcaption>One command per binary and device; rank count is reconciled with the devices actually assigned.</figcaption>
</figure>
</div>
<div class="media-text" markdown="1">
**`gpu_submit` / `cpu_submit` — refusing a bad submission.** The launchers pick free GPUs automatically (or accept an explicit `-gpu 3 4` list), reconcile the requested rank count with the number of GPUs actually assigned, handle the `CUDA_VISIBLE_DEVICES` mapping, and invoke the right VASP binary — `vasp_std`, `vasp_gam` or `vasp_ncl`. A submission that would collide with a running job is flagged before it starts rather than discovered afterwards.
</div>
</div>

**`vasp_notify.sh` — reading the outcome out of OUTCAR.** Parses convergence (`reached required accuracy`), clean versus abnormal termination, elapsed time, ionic steps completed against `NSW`, and the final maximum force computed directly from the `TOTAL-FORCE` table — so it works regardless of `IBRION` — alongside the settings from `INCAR` and `KPOINTS`. Results go to a Google Sheets log via Apps Script and a Telegram message for the immediate alert.

## Results & visualization

<div class="media-row media-wide">
<div class="media-col">
<figure>
  <img src="{{ '/assets/img/vasp_run_log.jpg' | relative_url }}" alt="Google Sheets log of finished VASP runs">
  <figcaption>Every finished run lands here: start and end time, path, convergence, energy, cut-off, k-points, and ENCUT...</figcaption>
</figure>
</div>
<div class="media-text" markdown="1">
- Per-GPU load and per-user occupancy visible in one command, on a server that offers neither.
- Finished runs land in a Sheets log with convergence, energy, runtime and settings attached, and an alert arrives without anyone watching the terminal.
- The log is queryable after the fact, so a calculation can be traced back to the exact parameters that produced it.
</div>
</div>

## Impacts

- The launchers are in routine use by the group, not just by me — the monitoring gap they fill was a shared one.
- Failed runs surface in minutes instead of at the next login, which is the difference between re-queuing the same day and losing one.
- Every logged calculation keeps its own parameters, so a result stays reproducible after the working directory has been forgotten.

## Skills

Python · Bash · Linux · REST APIs (Google Script API, Telegram API) · multi-server workflow automation


