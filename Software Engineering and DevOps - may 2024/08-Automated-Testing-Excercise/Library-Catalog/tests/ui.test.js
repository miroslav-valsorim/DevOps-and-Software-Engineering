const {test, expect} = require('@playwright/test');

const pageURL = "http://localhost:3000/"

test('Verify "All books" link is visible.', async ({page}) => {
    await page.goto(pageURL);
    await page.waitForSelector('nav.navbar');
    const allBooksLink = await page.$('a[href="/catalog"]');
    const isLinkVisible = await allBooksLink.isVisible();
    expect(isLinkVisible).toBe(true);
}
);

test('Verify "Login" button is visible.', async ({page}) => {
    await page.goto(pageURL);
    await page.waitForSelector('nav.navbar');
    const loginButton = await page.$('a[href="/login"]');
    const isLoginButtonVisible = await loginButton.isVisible();
    expect(isLoginButtonVisible).toBe(true);
}
);

test('Verify "Register" button is visible.', async ({page}) => {
    await page.goto(pageURL);
    await page.waitForSelector('#site-header > nav');
    const registerButton = await page.$('a[href="/register"]');
    const isRegisterButtonVisible = await registerButton.isVisible();
    expect(isRegisterButtonVisible).toBe(true);
}
);

test('Verify "All Books" link is visible after user login.', async ({page}) => {
    await page.goto(pageURL + 'login');
    await page.fill('input[name="email"]', 'peter@abv.bg');
    await page.fill('input[name="password"]', '123456');
    await page.click('input[type="submit"]');

    const allBooksLink = await page.$('a[href="/catalog"]');
    const isAllBooksLinkVisible = await allBooksLink.isVisible();
    expect(isAllBooksLinkVisible).toBe(true);
}
);

test('Verify "My Books" link is visible after user login.', async ({page}) => {
    await page.goto(pageURL + 'login');
    await page.fill('input[name="email"]', 'peter@abv.bg');
    await page.fill('input[name="password"]', '123456');
    await page.click('input[type="submit"]');

    const myBooksLink = await page.$('a[href="/create"]');
    const isMyBooksLinkVisible = await myBooksLink.isVisible();
    expect(isMyBooksLinkVisible).toBe(true);
}
);

test('Verify "Add Book" link is visible after user login.', async ({page}) => {
    await page.goto(pageURL + 'login');
    await page.fill('input[name="email"]', 'peter@abv.bg');
    await page.fill('input[name="password"]', '123456');
    await page.click('input[type="submit"]');


    const addBooksLink = await page.$('a[href="/profile"]');
    const isAddBooksLinkVisible = await addBooksLink.isVisible();
    expect(isAddBooksLinkVisible).toBe(true);
}
);

test('Login with valid credentials.', async ({page}) => {
    await page.goto(pageURL + 'login');
    await page.fill('input[name="email"]', 'peter@abv.bg');
    await page.fill('input[name="password"]', '123456');
    await page.click('input[type="submit"]');

    await page.$('a[href="/catalog"]');
    expect(page.url()).toBe(pageURL + 'catalog');
}
);
