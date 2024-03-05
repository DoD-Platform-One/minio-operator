describe('Minio Operator Console Login', function() {
  it('Check Minio Operator Console Login', function() {
      cy.visit(Cypress.env('url'), { timeout: 15000 })
      
      // Verify the page title is "Home"
      cy.title().should('eq', 'MinIO Operator');
  })
})
