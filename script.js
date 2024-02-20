import http from 'k6/http';
import { sleep } from 'k6';

export const options = {
  vus: 1000,
  duration: '120s',
};

export default function() {
  http.get('http://67.202.37.43/');
  sleep(1);
}
