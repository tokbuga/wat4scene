# turbouuid

Fast UUID generator / an alternative for `crypto.randomUUID`.

Designed for performance-critical applications, `turbouuid` uses a pre-allocated buffer strategy to generate UUIDs significantly faster than the native implementation.

## Performance

Benchmarks ran on 1,000,000 iterations show a massive performance gain:

-   **crypto.randomUUID**: ~1138ms
-   **turbouuid**: ~426ms

🚀 **~2.6x faster** than the native solution.

## Usage

The library attaches directly to `window.turboUUID` for browser environments.

```javascript
require('turbouuid');

// Returns a standard v4-like UUID string
console.log(turboUUID());
// Output example: f1235820-f090-3fce-a0d6-af6e26c6a0d6
```

## How It Works

Instead of re-allocating memory for every generation, `turbouuid` reuses a set of TypedArrays (`Float64Array`, `Uint32Array`, `Uint16Array`, `BigUint64Array`) sharing the same buffer. This minimizes garbage collection overhead and maximizes throughput.

## License

MIT
