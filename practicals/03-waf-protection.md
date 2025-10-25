# Lab: Enable WAF (v2) with a policy

Goal: Protect your app using WAF_v2 with a policy in Prevention mode.

## Steps
1) Deploy `terraform/waf-appgw` (creates gateway + WAF policy).
2) Start in Detection mode; generate some traffic; review firewall logs.
3) Switch to Prevention mode when comfortable; handle false positives with exclusions.

## Validation
- Send a simple SQLi test payload to confirm blocking when in Prevention mode.
- Verify logs in Log Analytics: `AzureDiagnostics` table for ApplicationGatewayFirewallLog.

## Notes
- Keep WAF rules up to date (OWASP 3.x). Review release notes.
