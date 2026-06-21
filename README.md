# ModularDemo

A small iOS project that shows how Swift Package Manager can be used to split an app into independent, locally compiled modules — and how those module boundaries are enforced by the compiler instead of by convention.

No real API calls. No complicated UI. Just enough code to demonstrate how the pieces talk to each other, and how the build behaves when you change one piece versus another.

---

## Why this exists

I built this after writing about modular iOS architecture and realising the best way to actually understand it is to watch it work — not just read about it.

This repo is the hands-on companion to that. If you've ever wondered what "modular architecture" really means beyond the buzzword, or whether splitting your code into separate folders actually helps your build times (spoiler: it doesn't, but separate packages do) — this project answers that with working code you can break and fix yourself.

I wrote a full walkthrough of the thinking behind this, including the benefits, the drawbacks, and when you should and shouldn't bother with SPM at all:

**📖 [Swift Package Manager: The Tool I Wish I'd Taken Seriously Years Earlier](https://habiburrahmanovie.com/blog/swift_package_manager_the_tool_i_wish_i_d_taken_seriously_years_earlier)**

That article is the "why." This repo is the "show me."

---

## Project architecture

The app is split into four local Swift packages plus a thin App layer that wires everything together.

```
ModularDemo
       │
       ▼
┌─────────────┬─────────────┐
│   Login     │    Chat     │   ← Feature modules
│  (Feature)  │  (Feature)  │      independent, don't know about each other
└──────┬──────┴──────┬──────┘
       │             │
       └──────┬──────┘
              ▼
        ┌───────────┐
        │ Networking │              ← Core module
        └─────┬──────┘
              ▼
        ┌─────────────┐
        │ FoundationKit│            ← Foundation module
        └─────────────┘
```

### The rule that makes this work

**Dependencies only point downward.**

- `Login` and `Chat` both depend on `Networking` and `FoundationKit`
- `Login` and `Chat` do **not** depend on each other
- `Networking` depends only on `FoundationKit`
- `FoundationKit` depends on nothing

This isn't just a diagram — it's enforced in each package's `Package.swift` file. If `Chat` tries to `import Login`, the project will not compile. There's no rule to remember, no code review checklist required. The compiler simply won't allow it.

---

## How each module talks to each other

| Module | Depends on | Exposes | Knows about |
|---|---|---|---|
| `FoundationKit` | nothing | `AppLogger` | nothing |
| `Networking` | `FoundationKit` | `APIClientProtocol`, `APIClient` | `FoundationKit` only |
| `Login` | `FoundationKit`, `Networking` | `LoginViewModel`, `LoginView` | Core modules only — not `Chat` |
| `Chat` | `FoundationKit`, `Networking` | `ChatViewModel`, `ChatView` | Core modules only — not `Login` |
| `ModularDemo` (App) | `Login`, `Chat` | — | Everything, because it assembles everything |

The App target is the only place in the entire project that knows all four modules exist. Its `CompositionRoot` builds a single shared `APIClient` and hands it to both `LoginViewModel` and `ChatViewModel` — so both features use the same networking instance, without either feature needing to construct it or know how it's built.

```swift
struct CompositionRoot {
    let loginViewModel: LoginViewModel
    let chatViewModel: ChatViewModel

    init() {
        let apiClient = APIClient()
        self.loginViewModel = LoginViewModel(apiClient: apiClient)
        self.chatViewModel = ChatViewModel(apiClient: apiClient)
    }
}
```

That's the entire trick. Everything below the App layer stays decoupled. Everything above it just assembles the pieces.

---

## What you can actually try

This repo isn't just meant to be read — it's meant to be poked at.

- **Run the app.** Tap the Login and Chat buttons. Watch the console — each module logs its own activity independently.
- **Break the boundary on purpose.** Add `import Login` inside `ChatViewModel.swift` and try to build. Watch it fail with `No such module 'Login'`. That error is the whole architecture, summarised in one line.
- **Test the build cache.** Build once. Change a line inside `Chat` only, build again — notice how fast it is. Then change something inside `Networking` and build again — notice that both `Login` and `Chat` rebuild this time, but `FoundationKit` doesn't.

That last one is the part that actually convinces people. Folder structure doesn't give you that. Separate compilation units do.

---

## Tech stack

- SwiftUI
- Swift Package Manager (local packages)
- Swift Concurrency (`async/await`, `Sendable`)
- iOS 16+

---

## Getting started

```bash
git clone https://github.com/<your-username>/ModularDemo.git
cd ModularDemo
open ModularDemo.xcodeproj
```

Build and run on the simulator. No setup, no API keys, no backend — everything is simulated locally.

---

## Read more / connect

If this was useful, or you've got thoughts, disagreements, or your own modular war stories — I'd genuinely like to hear them.

- 📖 Full article and reasoning behind this project: [habiburrahmanovie.com/blog](https://habiburrahmanovie.com/blog/swift_package_manager_the_tool_i_wish_i_d_taken_seriously_years_earlier)
- 💼 Connect with me on LinkedIn: [linkedin.com/in/habibur-rahman48](https://www.linkedin.com/in/habibur-rahman48)
- 🛠️ Need help with iOS architecture, SPM migration, or app development: [my Fiverr profile](https://www.fiverr.com/s/2K3lNq4)

---

## License

Free to use, fork, and learn from. If you build on top of this for your own learning or a tutorial of your own, a credit back to this repo is appreciated but never required.
