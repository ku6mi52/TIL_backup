export function formatDate(date) {
  const year = date.getFullYear();
  const month = padZero(date.getMonth() + 1);
  const day = padZero(date.getDate());

  return `${year}${month}${date}`;
}

function padZero(num) {
  return String(num).padStart(2, "0");
}


