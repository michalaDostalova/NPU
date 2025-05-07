import { test, expect } from '@playwright/test';

test('has title', async ({ page }) => {
  await page.goto('https://npu.cz/cs');
  await expect(page).toHaveTitle(/Národní památkový ústav/);
})