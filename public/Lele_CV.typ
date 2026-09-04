// otta theme - graphical CV: soft terminal-green band, sans typography, skill pills
#set document(title: "Emanuele 'Lele' Calo - CV", author: "Emanuele 'Lele' Calo")

// Terminal green, toned down via alpha so it reads as a soft tint on white
#let brand = rgb("#00FF41").transparentize(82%)
#let ink = rgb("#1C2321")
#let muted = rgb("#5C6B62")
#let accent = rgb("#1E7A46")
#let pill-bg = rgb("#EAF4EC")
#let term-frame = rgb("#1F2925")

#set page(
  paper: "a4",
  margin: (top: 1.3cm, bottom: 1.8cm, x: 1.6cm),
  background: context {
    if counter(page).get().first() == 1 {
      place(top, rect(width: 100%, height: 5.0cm, fill: brand))
    }
  },
  numbering: "1",
  number-align: center,
)
#set text(font: "Source Sans 3", size: 10.5pt, fill: ink)
#set par(leading: 0.52em, spacing: 0.85em)
#set list(marker: text(fill: muted)[•], indent: 0.3em, body-indent: 0.5em)
#show link: set text(fill: accent)

#let pills-mode = state("pills-mode", false)

#let pill(body) = box(
  fill: pill-bg,
  radius: 0.9em,
  inset: (x: 0.75em, y: 0.4em),
  text(size: 0.82em, fill: ink, body),
)

// Split on top-level commas only, so "AWS (EKS, EC2)" stays one pill
#let split-top-level(s) = {
  let parts = ()
  let cur = ""
  let depth = 0
  for c in s {
    if c == "(" { depth += 1; cur += c } else if c == ")" { depth -= 1; cur += c } else if c == "," and depth == 0 {
      parts.push(cur.trim())
      cur = ""
    } else { cur += c }
  }
  if cur.trim() != "" { parts.push(cur.trim()) }
  parts
}

#let skill-pills(s) = split-top-level(s).map(p => pill(p)).join(h(0.45em))

// Generic *nix terminal-window frame holding the photo (plain dark title bar,
// shell title only - no macOS traffic lights, no Windows buttons)
#let terminal-photo(path) = box(
  radius: 6pt,
  clip: true,
  stroke: 1pt + term-frame,
  width: 3.4cm,
)[
  #block(width: 100%, fill: term-frame, inset: (x: 8pt, y: 6pt), below: 0pt)[
    #text(fill: rgb("#9FB8A8"), size: 7.5pt, font: "DejaVu Sans Mono")[lele\@lo:\~]
    #h(0.3em)
    #box(fill: rgb("#9FB8A8"), width: 0.42em, height: 0.72em, baseline: 12%)
  ]
  #image(path, width: 100%, height: 3.0cm, fit: "cover")
]

#grid(columns: (1fr, auto), column-gutter: 1.4em,
  [
    #text(size: 24pt, weight: "bold")[Emanuele 'Lele' Calo]

    #text(size: 1.02em, weight: "semibold")[Head of Infrastructure | DevOps\/SRE\/Infra | Blockchain Infrastructure Expert]

    #text(size: 0.95em, weight: "medium")[
me\@lele.rip    #h(0.9em) #link("https://linkedin.com/in/emanuelecalo")[#text(weight: "bold")[LinkedIn]]
    #h(0.9em) #link("https://github.com/eldios")[#text(weight: "bold")[GitHub]]
    #h(0.9em) #link("https://lele.rip/")[#text(weight: "bold")[lele.rip]]
    #h(0.9em) Lucca, Italy (Remote)
    ]
  ],
  move(dy: -0.4cm, terminal-photo("Lele_pic.jpg")),
)

#v(0.9cm)

#pills-mode.update(false)
#block(sticky: true, above: 1.6em)[#text(size: 1.4em, weight: "bold")[PROFESSIONAL SUMMARY]]

- 20+ years building\/scaling infrastructure | 10+ years DevOps\/SRE\/TechLead

- Certified Kubernetes Administrator | Blockchain infrastructure specialist

- Crypto enthusiast, founder and builder | Multiple startups founding member

- Tech evangelist passionate about mentoring and knowledge sharing

#pills-mode.update(false)
#block(sticky: true, above: 1.6em)[#text(size: 1.4em, weight: "bold")[KEY ACHIEVEMENTS & NERD CREDs]]

- Built infrastructure handling millions of blockchain transactions daily

- Mentored 50+ engineers in DevOps best practices

- Conference speaker on infrastructure and crypto\/blockchain topics

- Merged upstream contributions to PebbleOS, Kata Containers, lazygit, Vial, Teleport and more

#pills-mode.update(false)
#block(sticky: true, above: 1.6em)[#text(size: 1.4em, weight: "bold")[EXPERIENCE]]

#block(above: 1.3em, breakable: false)[
#grid(columns: (1fr, auto), column-gutter: 1em,
  text(weight: "bold", size: 1.02em)[Head of Infrastructure, #link("https://linera.io")[Linera]],
  align(right + top, text(fill: muted, size: 0.88em)[Jul 2025 - Jul 2026]),
)
#text(fill: muted, size: 0.92em)[#link("https://linera.io")[https:\/\/linera.io] | New L1 Blockchain Protocol]

- Own end-to-end infrastructure architecture: validator\/node topology for a distributed consensus network
- Built the Kubernetes + ArgoCD GitOps platform (AWS, OpenTofu) enabling reproducible deployments across dev, testnet, and mainnet environments
- Acting Staff Engineer: mentor Rust engineers on production infra patterns, align infrastructure, protocol, and SDK roadmaps
]

#block(above: 1.3em, breakable: false)[
#grid(columns: (1fr, auto), column-gutter: 1em,
  text(weight: "bold", size: 1.02em)[Head of Infrastructure, #link("https://switchboard.xyz")[Switchboard]],
  align(right + top, text(fill: muted, size: 0.88em)[Mar 2024 - Jul 2025]),
)
#text(fill: muted, size: 0.92em)[#link("https://switchboard.xyz")[https:\/\/switchboard.xyz] | Decentralized Oracle Network (Solana)]

- Architected high-availability oracle infrastructure on confidential computing (AMD SEV-SNP, Intel SGX), securing oracle data integrity
- Unified DevOps practices across engineering teams; ran the AWS, Kubernetes, and Terraform distributed infrastructure
- Shipped Rust and TypeScript automation for oracle operations
]

#block(above: 1.3em, breakable: false)[
#grid(columns: (1fr, auto), column-gutter: 1em,
  text(weight: "bold", size: 1.02em)[Lead SRE, #link("https://tint.ai")[Tint]],
  align(right + top, text(fill: muted, size: 0.88em)[Mar 2023 - Jan 2024]),
)
#text(fill: muted, size: 0.92em)[#link("https://tint.ai")[https:\/\/tint.ai] | AI Platform]

- Owned cloud infrastructure decisions and architecture; built scalable Kubernetes infrastructure for AI workloads
- Established the SRE function from scratch: SLI\/SLOs, on-call, disaster recovery and high-availability design, mentorship program
]

#block(above: 1.3em, breakable: false)[
#grid(columns: (1fr, auto), column-gutter: 1em,
  text(weight: "bold", size: 1.02em)[Senior DevOps & SRE, #link("https://kraken.com")[Kraken]],
  align(right + top, text(fill: muted, size: 0.88em)[Mar 2022 - Nov 2022]),
)
#text(fill: muted, size: 0.92em)[#link("https://kraken.com")[https:\/\/kraken.com] | Top-5 Global Crypto Exchange]

- CORE reliability team member for an exchange handling billions in daily trading volume
- Developed critical services for trading and staking systems; drove security best practices across multiple teams
]

#block(above: 1.3em, breakable: false)[
#grid(columns: (1fr, auto), column-gutter: 1em,
  text(weight: "bold", size: 1.02em)[Senior DevOps, #link("https://ada.cx")[Ada]],
  align(right + top, text(fill: muted, size: 0.88em)[Jan 2021 - Mar 2022]),
)
#text(fill: muted, size: 0.92em)[#link("https://ada.cx")[https:\/\/ada.cx] | AI Customer Service Platform]

- Maintained 99.9\% uptime in 24\/7 on-call rotation; architected MongoDB clusters and AWS infrastructure
- Led infrastructure planning as Staff Engineer; mentored the team on Kubernetes and Terraform
]

#block(above: 1.3em, breakable: false)[
#grid(columns: (1fr, auto), column-gutter: 1em,
  text(weight: "bold", size: 1.02em)[DevOps & SRE, #link("https://goteleport.com")[Teleport]],
  align(right + top, text(fill: muted, size: 0.88em)[Jul 2017 - Dec 2020]),
)
#text(fill: muted, size: 0.92em)[#link("https://goteleport.com")[https:\/\/goteleport.com] | Zero-Trust Access Platform (Open Source)]

- Built secure access infrastructure adopted by Fortune 500 companies
- Implemented zero-trust network architectures and Kubernetes-native security; contributed upstream to the open-source project
]

#block(above: 1.3em, breakable: false)[
#grid(columns: (1fr, auto), column-gutter: 1em,
  text(weight: "bold", size: 1.02em)[Hosting Team Leader, #link("https://endpoint.com")[End Point Inc.]],
  align(right + top, text(fill: muted, size: 0.88em)[Aug 2012 - Jun 2017]),
)
#text(fill: muted, size: 0.92em)[#link("https://endpoint.com")[https:\/\/endpoint.com] | E-commerce Solutions]

- Led a team of 10 engineers managing enterprise hosting infrastructure
- Automated Linux systems at scale; monitoring and alerting for 100+ client systems
]

#block(above: 1.3em, breakable: false)[
#grid(columns: (1fr, auto), column-gutter: 1em,
  text(weight: "bold", size: 1.02em)[Founder, #link("https://sshadm.in")[sshadm.in]],
  align(right + top, text(fill: muted, size: 0.88em)[Apr 2012 - present]),
)
#text(fill: muted, size: 0.92em)[#link("https://sshadm.in")[https:\/\/sshadm.in] | Consulting & hosting side project]

- Consulting company for side projects
- Web Hosting services for a few small customers
- Sandbox where new tech gets tested first (NixOS, Kubernetes, Terraform, AWS, Hetzner, Cloudflare, etc..)
]

#pills-mode.update(false)

#emph[Earlier positions (2004-2012): see #link("https://www.linkedin.com/in/emanuelecalo/")[LinkedIn] for the full history]

#pills-mode.update(false)
#block(sticky: true, above: 1.6em)[#text(size: 1.4em, weight: "bold")[OPEN SOURCE]]

Most of my work is infra and lives in private repos - these are the public bits and contributions. More at #link("https://github.com/eldios?tab=repositories")[github.com\/eldios]

#pills-mode.update(false)
#block(sticky: true, above: 1.1em)[#text(size: 1.08em, weight: "bold")[Personal Open Projects]]

#block(above: 0.9em, breakable: false)[
#strong[tokentide] - #link("https://github.com/eldios/tokentide")[https:\/\/github.com\/eldios\/tokentide] \
Standalone Claude Code usage monitor for M5Stack devices: ESPHome package with per-board layouts, OTA updates, polls Anthropic directly with no host software]

#block(above: 0.9em, breakable: false)[
#strong[dotfiles] - #link("https://github.com/eldios/dotfiles")[https:\/\/github.com\/eldios\/dotfiles] \
Fully reproducible NixOS\/nixPkgs system & home configuration - actively maintained daily driver]

#block(above: 0.9em, breakable: false)[
#strong[TimelyNG] - #link("https://github.com/eldios/TimelyNG")[https:\/\/github.com\/eldios\/TimelyNG] \
Modernized the classic Timely watchface for the new Core Devices Pebble SDK: complications, adaptive layout, WYSIWYG settings, coloured weather icons, Nix dev shell]

#block(above: 0.9em, breakable: false)[
#strong[nomad-on-docker] - #link("https://github.com/eldios/nomad-on-docker")[https:\/\/github.com\/eldios\/nomad-on-docker] \
Local HashiCorp Nomad cluster in Docker - covered in the first video on my YouTube channel #link("https://www.youtube.com/@LeleOnTech")[LeleOnTech]]

#pills-mode.update(false)
#block(sticky: true, above: 1.1em)[#text(size: 1.08em, weight: "bold")[Upstream Contributions]]

#block(above: 0.9em, breakable: false)[
#strong[PebbleOS (Core Devices)] - #link("https://github.com/coredevices/PebbleOS")[https:\/\/github.com\/coredevices\/PebbleOS] \
OS-level PIN lockscreen with a new Security settings section for the revived Pebble smartwatch OS (PR on hold)]

#block(above: 0.9em, breakable: false)[
#strong[Home Assistant ecosystem (ha-petkit)] - #link("https://github.com/aavdberg/ha-petkit")[https:\/\/github.com\/aavdberg\/ha-petkit] \
Fixed the BLE config-flow so already-bound Petkit devices re-pair instead of dead-ending]

#block(above: 0.9em, breakable: false)[
#strong[docker-external-dns] - #link("https://github.com/timk153/docker-external-dns")[https:\/\/github.com\/timk153\/docker-external-dns] \
Wildcard support for A, CNAME and MX records in label-driven Cloudflare DNS for Docker Compose - merged upstream]

#block(above: 0.9em, breakable: false)[
#strong[lazygit] - #link("https://github.com/jesseduffield/lazygit")[https:\/\/github.com\/jesseduffield\/lazygit] \
Two merged bugfixes in the most popular git TUI, including stderr redirection handling (Go)]

#block(above: 0.9em, breakable: false)[
#strong[Vial (QMK-based keyboard firmware)] - #link("https://github.com/vial-kb/vial-qmk")[https:\/\/github.com\/vial-kb\/vial-qmk] \
Added Vial support for the Gizmo GK6 (OLKB) keyboard - C firmware merged upstream, now shipped in every Vial build]

#block(above: 0.9em, breakable: false)[
#strong[Kata Containers] - #link("https://github.com/kata-containers/kata-containers")[https:\/\/github.com\/kata-containers\/kata-containers] \
Upstream PR born from production TEE work - Confidential Computing (Intel SGX \/ AMD SEV-SNP) container runtimes on Kubernetes (on hold)]

#block(above: 0.9em, breakable: false)[
#strong[Teleport] - #link("https://github.com/gravitational/teleport")[https:\/\/github.com\/gravitational\/teleport] \
Several merged PRs (packaging fixes, cert-auth backport) - contributed while working there]

#block(above: 0.9em, breakable: false)[
#strong[qbz] - #link("https://github.com/vicrodh/qbz")[https:\/\/github.com\/vicrodh\/qbz] \
Nix build fix (libjack2) for the hi-fi Qobuz desktop player for Linux and macOS]

#pills-mode.update(true)
#block(sticky: true, above: 1.6em)[#text(size: 1.4em, weight: "bold")[TECHNICAL SKILLS]]

#block(above: 0.9em)[#text(weight: "bold")[Certifications]: CKA - Certified Kubernetes Administrator (#link("https://lele.rip/cka_2018.png")[https:\/\/lele.rip\/cka\_2018.png])]


#context if pills-mode.get() {
  block(above: 1.1em, breakable: false)[
    #text(weight: "bold", size: 0.92em)[Orchestration]
    #linebreak()
    #v(0.15em)
    #skill-pills("Kubernetes (k3s/k8s/EKS/GKE), Docker, Helm, Kustomize")
  ]
} else {
  block(above: 0.55em)[#text(weight: "bold")[Orchestration]: Kubernetes (k3s\/k8s\/EKS\/GKE), Docker, Helm, Kustomize]
}


#context if pills-mode.get() {
  block(above: 1.1em, breakable: false)[
    #text(weight: "bold", size: 0.92em)[GitOps & IaC]
    #linebreak()
    #v(0.15em)
    #skill-pills("ArgoCD, OpenTofu/Terraform, Ansible, Crossplane, Packer")
  ]
} else {
  block(above: 0.55em)[#text(weight: "bold")[GitOps & IaC]: ArgoCD, OpenTofu\/Terraform, Ansible, Crossplane, Packer]
}


#context if pills-mode.get() {
  block(above: 1.1em, breakable: false)[
    #text(weight: "bold", size: 0.92em)[Cloud]
    #linebreak()
    #v(0.15em)
    #skill-pills("AWS (EKS, EC2, S3, Lambda, RDS), GCP (GKE, Cloud Run), bare metal (Hetzner, OVH, Latitude)")
  ]
} else {
  block(above: 0.55em)[#text(weight: "bold")[Cloud]: AWS (EKS, EC2, S3, Lambda, RDS), GCP (GKE, Cloud Run), bare metal (Hetzner, OVH, Latitude)]
}


#context if pills-mode.get() {
  block(above: 1.1em, breakable: false)[
    #text(weight: "bold", size: 0.92em)[Languages]
    #linebreak()
    #v(0.15em)
    #skill-pills("Bash/Shell, Go, Rust, Python, TypeScript, Ruby, Perl, Solidity")
  ]
} else {
  block(above: 0.55em)[#text(weight: "bold")[Languages]: Bash\/Shell, Go, Rust, Python, TypeScript, Ruby, Perl, Solidity]
}


#context if pills-mode.get() {
  block(above: 1.1em, breakable: false)[
    #text(weight: "bold", size: 0.92em)[Blockchain]
    #linebreak()
    #v(0.15em)
    #skill-pills("Solana (validator ops, on-chain programs), Ethereum (node ops, smart contracts), Bitcoin/Lightning, oracle networks, MEV")
  ]
} else {
  block(above: 0.55em)[#text(weight: "bold")[Blockchain]: Solana (validator ops, on-chain programs), Ethereum (node ops, smart contracts), Bitcoin\/Lightning, oracle networks, MEV]
}


#context if pills-mode.get() {
  block(above: 1.1em, breakable: false)[
    #text(weight: "bold", size: 0.92em)[Confidential Computing]
    #linebreak()
    #v(0.15em)
    #skill-pills("AMD SEV-SNP, Intel SGX, Kata Containers on Kubernetes")
  ]
} else {
  block(above: 0.55em)[#text(weight: "bold")[Confidential Computing]: AMD SEV-SNP, Intel SGX, Kata Containers on Kubernetes]
}


#context if pills-mode.get() {
  block(above: 1.1em, breakable: false)[
    #text(weight: "bold", size: 0.92em)[Observability]
    #linebreak()
    #v(0.15em)
    #skill-pills("Prometheus/Grafana, OpenTelemetry, Datadog, ELK/OpenSearch, SLI/SLO design")
  ]
} else {
  block(above: 0.55em)[#text(weight: "bold")[Observability]: Prometheus\/Grafana, OpenTelemetry, Datadog, ELK\/OpenSearch, SLI\/SLO design]
}


#context if pills-mode.get() {
  block(above: 1.1em, breakable: false)[
    #text(weight: "bold", size: 0.92em)[Databases]
    #linebreak()
    #v(0.15em)
    #skill-pills("PostgreSQL, MySQL, MongoDB (sharding), Redis (cluster/sentinel), TimescaleDB")
  ]
} else {
  block(above: 0.55em)[#text(weight: "bold")[Databases]: PostgreSQL, MySQL, MongoDB (sharding), Redis (cluster\/sentinel), TimescaleDB]
}


#context if pills-mode.get() {
  block(above: 1.1em, breakable: false)[
    #text(weight: "bold", size: 0.92em)[Network & Security]
    #linebreak()
    #v(0.15em)
    #skill-pills("WireGuard, zero-trust/mTLS, HAProxy, nginx, Traefik, Cloudflare, CoreDNS, Vault/OpenBao, SELinux")
  ]
} else {
  block(above: 0.55em)[#text(weight: "bold")[Network & Security]: WireGuard, zero-trust\/mTLS, HAProxy, nginx, Traefik, Cloudflare, CoreDNS, Vault\/OpenBao, SELinux]
}


#context if pills-mode.get() {
  block(above: 1.1em, breakable: false)[
    #text(weight: "bold", size: 0.92em)[OS]
    #linebreak()
    #v(0.15em)
    #skill-pills("NixOS (primary, everywhere it makes sense), Arch (ex-AUR maintainer of ~20 pkgs), Debian/Ubuntu, RHEL/CentOS")
  ]
} else {
  block(above: 0.55em)[#text(weight: "bold")[OS]: NixOS (primary, everywhere it makes sense), Arch (ex-AUR maintainer of \~20 pkgs), Debian\/Ubuntu, RHEL\/CentOS]
}


#pills-mode.update(false)
#block(sticky: true, above: 1.6em)[#text(size: 1.4em, weight: "bold")[BEYOND THE TERMINAL]]

#context if pills-mode.get() {
  block(above: 1.1em, breakable: false)[
    #text(weight: "bold", size: 0.92em)[Timezone]
    #linebreak()
    #v(0.15em)
    #skill-pills("UTC+1 (CET/CEST) | works US hours (ET → PST)")
  ]
} else {
  block(above: 0.55em)[#text(weight: "bold")[Timezone]: UTC+1 (CET\/CEST) | works US hours (ET → PST)]
}


#context if pills-mode.get() {
  block(above: 1.1em, breakable: false)[
    #text(weight: "bold", size: 0.92em)[Hardware & DIY]
    #linebreak()
    #v(0.15em)
    #skill-pills("custom mechanical keyboards (QMK/ZMK), 3D printing, ESP32/Arduino, Home Assistant - homelabbing & self-hosting since early 2000s")
  ]
} else {
  block(above: 0.55em)[#text(weight: "bold")[Hardware & DIY]: custom mechanical keyboards (QMK\/ZMK), 3D printing, ESP32\/Arduino, Home Assistant - homelabbing & self-hosting since early 2000s]
}


#context if pills-mode.get() {
  block(above: 1.1em, breakable: false)[
    #text(weight: "bold", size: 0.92em)[Early adopter]
    #linebreak()
    #v(0.15em)
    #skill-pills("Docker v0.9, Kubernetes v1.2, NodeJS v0.3.x, Android v1.6, Minecraft alpha ($9.99 gang)")
  ]
} else {
  block(above: 0.55em)[#text(weight: "bold")[Early adopter]: Docker v0.9, Kubernetes v1.2, NodeJS v0.3.x, Android v1.6, Minecraft alpha (\$9.99 gang)]
}


#context if pills-mode.get() {
  block(above: 1.1em, breakable: false)[
    #text(weight: "bold", size: 0.92em)[Gaming & geekery]
    #linebreak()
    #v(0.15em)
    #skill-pills("roguelikes (Dwarf Fortress, Noita, NetHack), tabletop RPGs (D&D, Pathfinder, Cyberpunk), retro computing")
  ]
} else {
  block(above: 0.55em)[#text(weight: "bold")[Gaming & geekery]: roguelikes (Dwarf Fortress, Noita, NetHack), tabletop RPGs (D&D, Pathfinder, Cyberpunk), retro computing]
}


#context if pills-mode.get() {
  block(above: 1.1em, breakable: false)[
    #text(weight: "bold", size: 0.92em)[Volunteering]
    #linebreak()
    #v(0.15em)
    #skill-pills("Scout leader & national IT team (CNGEI) - adult trainer, association infra")
  ]
} else {
  block(above: 0.55em)[#text(weight: "bold")[Volunteering]: Scout leader & national IT team (CNGEI) - adult trainer, association infra]
}


#context if pills-mode.get() {
  block(above: 1.1em, breakable: false)[
    #text(weight: "bold", size: 0.92em)[Sports]
    #linebreak()
    #v(0.15em)
    #skill-pills("Acrobatic gymnastics, climbing, bouldering")
  ]
} else {
  block(above: 0.55em)[#text(weight: "bold")[Sports]: Acrobatic gymnastics, climbing, bouldering]
}


#context if pills-mode.get() {
  block(above: 1.1em, breakable: false)[
    #text(weight: "bold", size: 0.92em)[Family]
    #linebreak()
    #v(0.15em)
    #skill-pills("married, 2 sons, 3+ cats :3")
  ]
} else {
  block(above: 0.55em)[#text(weight: "bold")[Family]: married, 2 sons, 3+ cats :3]
}


#context if pills-mode.get() {
  block(above: 1.1em, breakable: false)[
    #text(weight: "bold", size: 0.92em)[Languages]
    #linebreak()
    #v(0.15em)
    #skill-pills("Italian (native), English (fluent)")
  ]
} else {
  block(above: 0.55em)[#text(weight: "bold")[Languages]: Italian (native), English (fluent)]
}


#pills-mode.update(false)
#block(sticky: true, above: 1.6em)[#text(size: 1.4em, weight: "bold")[DOCUMENT FORMATS AND EXTERNAL RESOURCES]]

#context if pills-mode.get() {
  block(above: 1.1em, breakable: false)[
    #text(weight: "bold", size: 0.92em)[Markdown Version]
    #linebreak()
    #v(0.15em)
    #skill-pills("https://lele.rip/Lele_CV.md")
  ]
} else {
  block(above: 0.55em)[#text(weight: "bold")[Markdown Version]: https:\/\/lele.rip\/Lele\_CV.md]
}


#context if pills-mode.get() {
  block(above: 1.1em, breakable: false)[
    #text(weight: "bold", size: 0.92em)[Text Version]
    #linebreak()
    #v(0.15em)
    #skill-pills("https://lele.rip/Lele_CV.txt")
  ]
} else {
  block(above: 0.55em)[#text(weight: "bold")[Text Version]: https:\/\/lele.rip\/Lele\_CV.txt]
}


#context if pills-mode.get() {
  block(above: 1.1em, breakable: false)[
    #text(weight: "bold", size: 0.92em)[PDF Version]
    #linebreak()
    #v(0.15em)
    #skill-pills("https://lele.rip/Lele_CV.pdf")
  ]
} else {
  block(above: 0.55em)[#text(weight: "bold")[PDF Version]: https:\/\/lele.rip\/Lele\_CV.pdf]
}


#context if pills-mode.get() {
  block(above: 1.1em, breakable: false)[
    #text(weight: "bold", size: 0.92em)[Photo]
    #linebreak()
    #v(0.15em)
    #skill-pills("https://lele.rip/Lele_pic.jpg")
  ]
} else {
  block(above: 0.55em)[#text(weight: "bold")[Photo]: https:\/\/lele.rip\/Lele\_pic.jpg]
}

