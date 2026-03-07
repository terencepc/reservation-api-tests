import { check } from "k6";
import { login } from "../services/authService.js";

export function loginScenario() {
  const response = login("admin", "admin123");

  check(response, {
    "login success status 200": (r) => r.status === 200,
    "login response time < 500ms": (r) => r.timings.duration < 500
  });
}