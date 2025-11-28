# Profile System

The SentinelShell profile system lets you generate a reusable context file that can be pasted into ChatGPT or any LLM.  
This helps the AI understand your workflow, your tools, and your conventions, so its advice is more accurate and personalized.

The profile is optional, but extremely helpful for CTF and pentesting work.

---

## Generating a Profile

To create or update your profile:

```
gpt-session profile
```

This generates the file:

```
~/.gpt_sessions/profile.txt
```

If the file already exists, running the command again will overwrite it with updated content.

---

## What the Profile Contains

The profile includes:

- Your username
- Your OS and shell
- Your preferred pentesting workflow
- Tools you commonly use (nmap, ffuf, gobuster, curl, mysql, etc.)
- Notes about your directory structure (e.g., ~/thm/<room>/)
- Your learning goals
- How you prefer the AI to respond (step-by-step, hint-only, full explanation, etc.)

Example content might look like:

```
I am a cybersecurity learner using Kali Linux.
I solve CTF challenges on TryHackMe, HackTheBox, and picoCTF.
I prefer step-by-step explanations but not full automation.
I use ~/thm/<room>/recon as a standard directory structure.
I frequently use nmap, ffuf, gobuster, dirb, nikto, curl, dig, mysql.
```

You can edit the file by hand to further customize it.

---

## Using the Profile With ChatGPT

Paste the profile into ChatGPT before asking about logs or needing help.

Example:

```
Here's my SentinelShell profile. Please use it as context for the rest of this conversation.
```

Then follow with your log or question.

This allows the AI to:

- Tailor help to your workflow
- Understand your directory structure
- Provide hints at your preferred difficulty level
- Give tooling recommendations relevant to your setup

---

## Storing and Editing Profiles

The profile file lives here:

```
~/.gpt_sessions/profile.txt
```

You can edit it anytime:

```
nano ~/.gpt_sessions/profile.txt
```

You can delete it:

```
rm ~/.gpt_sessions/profile.txt
```

Running `gpt-session profile` again will regenerate it.

---

## Why Profiles Matter

A profile acts like a personal “README” for the AI about you.

It helps with:

- Consistent explanations  
- Better debugging help  
- Personalized pentesting guidance  
- Custom recon workflows  
- Learning reinforcement  

---

This document covers how SentinelShell generates and uses profile context to improve AI responses.

