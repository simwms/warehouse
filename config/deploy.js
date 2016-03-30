module.exports = function(deployTarget) {  
  return {
    pagefront: {
      app: 'warehouse',
      key: process.env.PAGEFRONT_KEY
    }
  };
};
