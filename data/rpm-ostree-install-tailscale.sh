#!/usr/bin/env bash
rpm-ostree install --apply-live --allow-inactive --assumeyes tailscale && \
systemctl enable --now tailscaled
