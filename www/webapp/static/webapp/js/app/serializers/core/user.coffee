Vosae.UserSerializer = Vosae.ApplicationSerializer.extend
  attrs:
    specificPermissions:
      embedded: 'always'
    settings:
      embedded: 'always'