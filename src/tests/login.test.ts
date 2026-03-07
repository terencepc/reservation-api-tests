import { loginScenario } from "../scenarios/login.js";

export const options = {
  vus: 100,
  duration: "1m",
  thresholds: {
    http_req_duration: ["p(95)<6000"],
    http_req_failed: ["rate<0.01"]
  }
};

export default function () {
  loginScenario();
}