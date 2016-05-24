class @ExtendableError extends Error
  constructor: (message = '') ->
    super message

    Object.defineProperty @, 'message',
      configurable: true
      enumerable : false
      value : message
      writable : true

    Object.defineProperty @, 'name',
      configurable: true
      enumerable : false
      value : @.constructor.name
      writable : true

    if Error.hasOwnProperty 'captureStackTrace'
      Error.captureStackTrace this, this.constructor
      return

    Object.defineProperty @, 'stack',
      configurable: true
      enumerable : false
      value : (new Error(message)).stack
      writable : true
