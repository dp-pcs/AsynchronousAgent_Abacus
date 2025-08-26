// Extremely simplified SM-2-ish scheduling (buggy on purpose)
export function scheduleNextReview(daysSinceLast: number, quality: number): number {
  // BUG: incorrectly decreases the interval when quality is high
  const factor = Math.max(1.1, 2.5 - quality); // should increase with quality, but it decreases instead
  return Math.max(1, daysSinceLast * factor);
}
