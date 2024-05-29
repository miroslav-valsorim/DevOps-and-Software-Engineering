const {test, expect} = require('@playwright/test');

const pageUrl = "http://localhost:5500"

test('user can add a task', async ({page})  => {
    await page.goto(pageUrl);
    await page.fill('#task-input', 'Test Task');
    await page.click('#add-task');
    const taskText = await page.textContent('.task');
    expect(taskText).toContain('Test Task');
});

test('user can delete a task', async ({page}) => {
    await page.goto(pageUrl);
    await page.fill('#task-input', 'Test Task');
    await page.click('#add-task');
    await page.click('.delete-task');
    const tasks = await page.$$eval('.task', tasks => tasks.map(task => task.textContent));
    expect(tasks).not.toContain('Test Task');
});

test('user mark the task as complete', async ({page}) => {
    await page.goto(pageUrl);
    await page.fill('#task-input', 'Test Task');
    await page.click('#add-task');
    await page.click('.task .task-complete');
    const taskCompleted = await page.$('.task.completed');
    expect(taskCompleted).not.toBeNull();
});

test('user filter tasks', async ({page}) => {
    await page.goto(pageUrl);
    await page.fill('#task-input', 'Test Task');
    await page.click('#add-task');
    await page.click('.task .task-complete');
    await page.selectOption('#filter', 'Completed')
    const filterTask = await page.$('.task:not(.completed)');
    expect(filterTask).toBeNull();
});

test('user check for completed task to be null', async({page}) => {
    await page.goto(pageUrl);
    await page.fill('#task-input', 'Test Task');
    await page.click('#add-task');
    await page.fill('#task-input', 'Test Task2')
    await page.click('#add-task');
    await page.selectOption('#filter', 'Completed')
    const filterTask = await page.$('.task.completed');
    expect(filterTask).toBeNull();
})