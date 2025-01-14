import { treaty } from "@elysiajs/eden";

import type { Server } from "../server";

const serverClient = treaty<Server>(window.location.origin);

export default serverClient;
