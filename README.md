# flutter-riverpod-concepts

A hands-on guide covering all core Riverpod concepts in Flutter with practical examples.

---

## Chapters Covered

### 1. What is Riverpod & Setup
Riverpod is a state management library for Flutter. Better than Provider — compile-safe, testable, no context needed.

### 2. StateProvider
Simplest provider. Use when you have a single primitive value (int, String, bool) that can change.
> Use for: counters, toggles, simple flags.

### 3. Consumer & ConsumerStatefulWidget
Widgets that can read and watch providers. `Consumer` for simple cases, `ConsumerStatefulWidget` when you also need lifecycle methods.
> Use when: you need to access providers inside a widget.

### 4. StateNotifierProvider
For complex state with multiple fields or multiple ways to change. Logic lives in a `StateNotifier` class.
> Use for: forms, lists, anything with multiple state changes.

### 5. FutureProvider
Handles async operations that run once and return a result. Built-in loading/error/data states.
> Use for: one-time API calls, fetching data on screen load.

### 6. StreamProvider
Like FutureProvider but for continuous streams of data.
> Use for: real-time data, Firebase snapshots, WebSockets.

### 7. API Calls with Riverpod
Combining FutureProvider + http to fetch and display real API data cleanly.
> Use for: REST API integration with proper loading and error handling.

### 8. NotifierProvider (Modern)
Modern replacement for StateNotifierProvider. Cleaner syntax, same power.
> Use for: any complex state in new projects (prefer this over StateNotifierProvider).

### 9. AsyncNotifierProvider
Modern replacement for FutureProvider when you also need methods to refresh or mutate data.
> Use for: async state that also needs actions (e.g. refresh, delete, update).

### 10. Family Modifier
Pass arguments to a provider. Each unique argument creates its own provider instance.
> Use for: fetching by ID, filtering by category, parameterized providers.

### 11. AutoDispose Modifier
Automatically destroys a provider when no widget is watching it anymore.
> Use for: screen-specific providers, API calls tied to one screen, saving memory.

### 12. Provider Dependencies
Providers that watch other providers. When a dependency changes, the dependent provider updates automatically.
> Use for: filtered lists, derived state, chaining API calls.

---

## Key Modifiers

| Modifier | What it does |
|---|---|
| `.family` | Pass an argument to a provider |
| `.autoDispose` | Destroy provider when no longer used |
| `.autoDispose.family` | Both combined — most common in real apps |

---

## Setup

```yaml
# pubspec.yaml
dependencies:
  flutter_riverpod: ^2.6.1
```

```dart
// main.dart
void main() {
  runApp(ProviderScope(child: MyApp()));
}
```

---
