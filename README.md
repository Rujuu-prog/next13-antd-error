This is a repository for reporting bugs in antd.

## Overview

Using @ant-design/charts, I get an error "Module not found: ESM packages (d3-interpolate) need to be imported. Use 'import' to reference the package instead".

I also tried the dynamic import method mentioned in the issue, but got the same error.

## Environment building

Container Launch

```bash
docker-compose up --build
```

Open [http://localhost:3000](http://localhost:3000) with your browser to see the result.

## Error

🔽 You will probably get the following error.

```bash
- error ./node_modules/@antv/g-base/lib/animate/timeline.js:5:23
Module not found: ESM packages (d3-interpolate) need to be imported. Use 'import' to reference the package instead. https://nextjs.org/docs/messages/import-esm-externals

https://nextjs.org/docs/messages/module-not-found

Import trace for requested module:
./node_modules/@antv/g-base/lib/abstract/canvas.js
./node_modules/@antv/g-base/lib/index.js
./node_modules/@antv/g2/lib/dependents.js
./node_modules/@antv/g2/lib/core.js
./node_modules/@antv/g2/lib/index.js
./node_modules/@antv/g2plot/lib/index.js
./node_modules/@ant-design/plots/lib/index.js
./node_modules/@ant-design/charts/lib/index.js
./app/page.tsx
- warn Fast Refresh had to perform a full reload due to a runtime error.
```

## Branch

### main

🔽 It imports as follows.

```typescript
import { Line } from "@ant-design/charts";
```

### dynamic

🔽 It imports as follows.

```typescript
import dynamic from "next/dynamic";
const Line = dynamic(
  () => import("@ant-design/charts").then((mod) => mod.Line),
  { ssr: false }
);
```
