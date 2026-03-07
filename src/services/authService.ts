import http from "k6/http";
import { BASE_URL, DEFAULT_HEADERS } from "../config/base.js";

export function login(username: string, password: string) {
  const payload = JSON.stringify({
    username: username,
    password: password
  });

  const params = {
    headers: DEFAULT_HEADERS
  };

  return http.post(`${BASE_URL}/api/admin/login`, payload, params);
}