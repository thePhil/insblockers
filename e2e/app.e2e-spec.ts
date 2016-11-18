import { InsblockersPage } from './app.po';

describe('insblockers App', function() {
  let page: InsblockersPage;

  beforeEach(() => {
    page = new InsblockersPage();
  });

  it('should display message saying app works', () => {
    page.navigateTo();
    expect(page.getParagraphText()).toEqual('app works!');
  });
});
