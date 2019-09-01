

# Group Comments


## Comments [/comments]


### Get all comments [GET /api/v1/tasks/{task_id}/comments]

+ Parameters
    + task_id: `1` (number, required)

+ Request success
**GET**&nbsp;&nbsp;`/api/v1/tasks/1/comments`

    + Headers

            Accept: text/xml,application/xml,application/xhtml+xml,text/html;q=0.9,text/plain;q=0.8,image/png,*/*;q=0.5

+ Response 200

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "data": [
                {
                  "id": "2",
                  "type": "comment",
                  "attributes": {
                    "body": "[\"officiis\", \"et\", \"non\", \"laborum\", \"sed\"]",
                    "image": {
                      "name": "image",
                      "record": {
                        "id": 2,
                        "body": "[\"officiis\", \"et\", \"non\", \"laborum\", \"sed\"]",
                        "task_id": 1,
                        "created_at": "2019-08-28T11:36:08.414Z",
                        "updated_at": "2019-08-28T11:36:08.418Z"
                      }
                    }
                  },
                  "relationships": {
                    "task": {
                      "data": {
                        "id": "1",
                        "type": "task"
                      }
                    }
                  }
                },
                {
                  "id": "1",
                  "type": "comment",
                  "attributes": {
                    "body": "[\"nesciunt\", \"non\", \"soluta\", \"voluptatem\", \"nobis\"]",
                    "image": {
                      "name": "image",
                      "record": {
                        "id": 1,
                        "body": "[\"nesciunt\", \"non\", \"soluta\", \"voluptatem\", \"nobis\"]",
                        "task_id": 1,
                        "created_at": "2019-08-28T11:36:08.405Z",
                        "updated_at": "2019-08-28T11:36:08.417Z"
                      }
                    }
                  },
                  "relationships": {
                    "task": {
                      "data": {
                        "id": "1",
                        "type": "task"
                      }
                    }
                  }
                }
              ]
            }

### Create a comment [POST /api/v1/tasks/{task_id}/comments]

+ Parameters
    + task_id: `85` (integer, required)
    + body: `quiamollitiaestrepellatdolorum` (string, required)
    + image: `ActionDispatch%3A%3AHttp%3A%3AUploadedFile` (image, optional)

+ Request success
**POST**&nbsp;&nbsp;`/api/v1/tasks/4/comments`

    + Headers

            Accept: text/xml,application/xml,application/xhtml+xml,text/html;q=0.9,text/plain;q=0.8,image/png,*/*;q=0.5
            Content-Type: application/x-www-form-urlencoded

    + Body

            comment[body]=noninciduntducimusututanimivoluptassaepevoluptatesdicta

+ Response 201

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "data": {
                "id": "5",
                "type": "comment",
                "attributes": {
                  "body": "noninciduntducimusututanimivoluptassaepevoluptatesdicta",
                  "image": {
                    "name": "image",
                    "record": {
                      "id": 5,
                      "body": "noninciduntducimusututanimivoluptassaepevoluptatesdicta",
                      "task_id": 4,
                      "created_at": "2019-08-28T11:36:08.473Z",
                      "updated_at": "2019-08-28T11:36:08.473Z"
                    }
                  }
                },
                "relationships": {
                  "task": {
                    "data": {
                      "id": "4",
                      "type": "task"
                    }
                  }
                }
              }
            }

+ Request unprocessable
**POST**&nbsp;&nbsp;`/api/v1/tasks/7/comments`

    + Headers

            Accept: text/xml,application/xml,application/xhtml+xml,text/html;q=0.9,text/plain;q=0.8,image/png,*/*;q=0.5
            Content-Type: application/x-www-form-urlencoded

    + Body

            comment[body]=123

+ Response 422

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "errors": {
                "body": [
                  "is too short (minimum is 10 characters)"
                ]
              }
            }

### Destroy the comment [DELETE /api/v1/comments/{id}]

+ Parameters
    + id: `85` (integer, required)

+ Request success
**DELETE**&nbsp;&nbsp;`/api/v1/comments/8`

    + Headers

            Accept: text/xml,application/xml,application/xhtml+xml,text/html;q=0.9,text/plain;q=0.8,image/png,*/*;q=0.5
            Content-Type: application/x-www-form-urlencoded

+ Response 204

+ Request not_found
**DELETE**&nbsp;&nbsp;`/api/v1/comments/999`

    + Headers

            Accept: text/xml,application/xml,application/xhtml+xml,text/html;q=0.9,text/plain;q=0.8,image/png,*/*;q=0.5
            Content-Type: application/x-www-form-urlencoded

+ Response 404

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "errors": "Couldn't find Comment with 'id'=999"
            }

# Group Projects


## Projects [/projects]


### Get all projects [GET /api/v1/projects]


+ Request success
**GET**&nbsp;&nbsp;`/api/v1/projects`

    + Headers

            Accept: text/xml,application/xml,application/xhtml+xml,text/html;q=0.9,text/plain;q=0.8,image/png,*/*;q=0.5

+ Response 200

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "data": [
                {
                  "id": "1",
                  "type": "project",
                  "attributes": {
                    "name": "ipsam"
                  },
                  "relationships": {
                    "user": {
                      "data": {
                        "id": "2",
                        "type": "user"
                      }
                    },
                    "tasks": {
                      "data": [
            
                      ]
                    }
                  }
                }
              ]
            }

### Show project [GET /api/v1/projects/{id}]

+ Parameters
    + id: `2` (number, required)

+ Request success
**GET**&nbsp;&nbsp;`/api/v1/projects/2`

    + Headers

            Accept: text/xml,application/xml,application/xhtml+xml,text/html;q=0.9,text/plain;q=0.8,image/png,*/*;q=0.5

+ Response 200

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "data": {
                "id": "2",
                "type": "project",
                "attributes": {
                  "name": "non"
                },
                "relationships": {
                  "user": {
                    "data": {
                      "id": "4",
                      "type": "user"
                    }
                  },
                  "tasks": {
                    "data": [
            
                    ]
                  }
                }
              }
            }

+ Request not_found
**GET**&nbsp;&nbsp;`/api/v1/projects/999`

    + Headers

            Accept: text/xml,application/xml,application/xhtml+xml,text/html;q=0.9,text/plain;q=0.8,image/png,*/*;q=0.5

+ Response 404

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "errors": "Couldn't find Project with 'id'=999"
            }

### Create a project [POST /api/v1/projects]

+ Parameters
    + name: `ducimusquis` (string, required)

+ Request created
**POST**&nbsp;&nbsp;`/api/v1/projects`

    + Headers

            Accept: text/xml,application/xml,application/xhtml+xml,text/html;q=0.9,text/plain;q=0.8,image/png,*/*;q=0.5
            Content-Type: application/x-www-form-urlencoded

    + Body

            project[name]=mollitiadicta

+ Response 201

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "data": {
                "id": "5",
                "type": "project",
                "attributes": {
                  "name": "mollitiadicta"
                },
                "relationships": {
                  "user": {
                    "data": {
                      "id": "8",
                      "type": "user"
                    }
                  },
                  "tasks": {
                    "data": [
            
                    ]
                  }
                }
              }
            }

+ Request unprocessable
**POST**&nbsp;&nbsp;`/api/v1/projects`

    + Headers

            Accept: text/xml,application/xml,application/xhtml+xml,text/html;q=0.9,text/plain;q=0.8,image/png,*/*;q=0.5
            Content-Type: application/x-www-form-urlencoded

    + Body

            project[name]

+ Response 422

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "errors": {
                "name": [
                  "can't be blank"
                ]
              }
            }

### Update the project [PUT /api/v1/projects/{id}]

+ Parameters
    + id: `60` (integer, required)
    + name: `exvoluptatem` (string, required)

+ Request success
**PUT**&nbsp;&nbsp;`/api/v1/projects/7`

    + Headers

            Accept: text/xml,application/xml,application/xhtml+xml,text/html;q=0.9,text/plain;q=0.8,image/png,*/*;q=0.5
            Content-Type: application/x-www-form-urlencoded

    + Body

            project[name]=quinumquam

+ Response 200

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "data": {
                "id": "7",
                "type": "project",
                "attributes": {
                  "name": "quinumquam"
                },
                "relationships": {
                  "user": {
                    "data": {
                      "id": "12",
                      "type": "user"
                    }
                  },
                  "tasks": {
                    "data": [
            
                    ]
                  }
                }
              }
            }

+ Request unprocessable
**PUT**&nbsp;&nbsp;`/api/v1/projects/8`

    + Headers

            Accept: text/xml,application/xml,application/xhtml+xml,text/html;q=0.9,text/plain;q=0.8,image/png,*/*;q=0.5
            Content-Type: application/x-www-form-urlencoded

    + Body

            project[name]

+ Response 422

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "errors": {
                "name": [
                  "can't be blank"
                ]
              }
            }

### Destroy project [DELETE /api/v1/projects/{id}]

+ Parameters
    + id: `9` (number, required)

+ Request success
**DELETE**&nbsp;&nbsp;`/api/v1/projects/9`

    + Headers

            Accept: text/xml,application/xml,application/xhtml+xml,text/html;q=0.9,text/plain;q=0.8,image/png,*/*;q=0.5
            Content-Type: application/x-www-form-urlencoded

+ Response 204

+ Request not_found
**DELETE**&nbsp;&nbsp;`/api/v1/projects/999`

    + Headers

            Accept: text/xml,application/xml,application/xhtml+xml,text/html;q=0.9,text/plain;q=0.8,image/png,*/*;q=0.5
            Content-Type: application/x-www-form-urlencoded

+ Response 404

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "errors": "Couldn't find Project with 'id'=999"
            }

###  [DELETE /api/v1/projects/{id}]

+ Parameters
    + id: `12` (number, required)

+ Request forbidden
**DELETE**&nbsp;&nbsp;`/api/v1/projects/12`

    + Headers

            Accept: text/xml,application/xml,application/xhtml+xml,text/html;q=0.9,text/plain;q=0.8,image/png,*/*;q=0.5
            Content-Type: application/x-www-form-urlencoded

+ Response 403

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "error": "Access Denied!"
            }

# Group Registrations


## Registrations [/registrations]


### Create user [POST /api/v1/auth/registrations]

+ Parameters
    + username: `hooin_k%D1%91ma` (string, required)
    + password: `elpsykongru` (string, required)
    + password_confirmation: `elpsykongru` (string, required)

+ Request created
**POST**&nbsp;&nbsp;`/api/v1/auth/registrations`

    + Headers

            Accept: text/xml,application/xml,application/xhtml+xml,text/html;q=0.9,text/plain;q=0.8,image/png,*/*;q=0.5
            Content-Type: application/x-www-form-urlencoded

    + Body

            user[username]=namest&user[password]=UqlaDOPhfcl&user[password_confirmation]=UqlaDOPhfcl

+ Response 201

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "csrf": "ynaxGiLrbU/iGQkynKWaowaq8BIWylrQ0WuPrlnCrMsNKSY9GhMeOmCitN5Pi9WOX9bQEV2hm0FisHtFt2gQHQ=="
            }

+ Request unprocessable
**POST**&nbsp;&nbsp;`/api/v1/auth/registrations`

    + Headers

            Accept: text/xml,application/xml,application/xhtml+xml,text/html;q=0.9,text/plain;q=0.8,image/png,*/*;q=0.5
            Content-Type: application/x-www-form-urlencoded

    + Body

            user[username]&user[password]

+ Response 422

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "errors": {
                "password": [
                  "can't be blank",
                  "is too short (minimum is 8 characters)"
                ],
                "username": [
                  "can't be blank",
                  "is too short (minimum is 3 characters)"
                ]
              }
            }

# Group Sessions


## Sessions [/sessions]


### Update session [PUT /api/v1/auth/sessions]


+ Request success
**PUT**&nbsp;&nbsp;`/api/v1/auth/sessions`

    + Headers

            Accept: text/xml,application/xml,application/xhtml+xml,text/html;q=0.9,text/plain;q=0.8,image/png,*/*;q=0.5
            Content-Type: application/x-www-form-urlencoded

+ Response 200

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "csrf": "gEopdj5l0HuQDsPH4wCQv4+AgXiAL10oH40y+ftdEipoMbRA3kkmgB4936ujcKgbFqvgp3kI7x5RiRAvQF25bA=="
            }

+ Request unauthorized
**PUT**&nbsp;&nbsp;`/api/v1/auth/sessions`

    + Headers

            Accept: text/xml,application/xml,application/xhtml+xml,text/html;q=0.9,text/plain;q=0.8,image/png,*/*;q=0.5
            Content-Type: application/x-www-form-urlencoded

+ Response 401

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "errors": "Unathorized"
            }

### Create session [POST /api/v1/auth/sessions]

+ Parameters
    + username: `hooin_k%D1%91ma` (string, required)
    + password: `elpsykongru` (string, required)

+ Request success
**POST**&nbsp;&nbsp;`/api/v1/auth/sessions`

    + Headers

            Accept: text/xml,application/xml,application/xhtml+xml,text/html;q=0.9,text/plain;q=0.8,image/png,*/*;q=0.5
            Content-Type: application/x-www-form-urlencoded

    + Body

            username=delectussaepe&password=UqlaDOPhfcl

+ Response 200

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "csrf": "hFaBe4EeK6scNRjDknYQXcWADi20Nb2MitVHMb7hBxkC8nhvfAR1CukA/yjfhBaxb2GneIfALvFCtMbvWHW23g=="
            }

+ Request not_found
**POST**&nbsp;&nbsp;`/api/v1/auth/sessions`

    + Headers

            Accept: text/xml,application/xml,application/xhtml+xml,text/html;q=0.9,text/plain;q=0.8,image/png,*/*;q=0.5
            Content-Type: application/x-www-form-urlencoded

    + Body

            username=uipnqaasutqereummsi&password=UqlaDOPhfcl

+ Response 404

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "errors": "Couldn't find User"
            }

+ Request unauthorized
**POST**&nbsp;&nbsp;`/api/v1/auth/sessions`

    + Headers

            Accept: text/xml,application/xml,application/xhtml+xml,text/html;q=0.9,text/plain;q=0.8,image/png,*/*;q=0.5
            Content-Type: application/x-www-form-urlencoded

    + Body

            username=autemnecessitatibus&password=

+ Response 401

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "errors": "Unathorized"
            }

### Destroy session [DELETE /api/v1/auth/sessions]


+ Request success
**DELETE**&nbsp;&nbsp;`/api/v1/auth/sessions`

    + Headers

            Accept: text/xml,application/xml,application/xhtml+xml,text/html;q=0.9,text/plain;q=0.8,image/png,*/*;q=0.5
            Content-Type: application/x-www-form-urlencoded

+ Response 200

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            "ok"

+ Request unathorized
**DELETE**&nbsp;&nbsp;`/api/v1/auth/sessions`

    + Headers

            Accept: text/xml,application/xml,application/xhtml+xml,text/html;q=0.9,text/plain;q=0.8,image/png,*/*;q=0.5
            Content-Type: application/x-www-form-urlencoded

+ Response 401

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "errors": "Unathorized"
            }

# Group Tasks


## Tasks [/tasks]


### Update state of a task [PATCH /api/v1/tasks/{task_id}/completions]

+ Parameters
    + task_id: `1` (number, required)

+ Request success
**PATCH**&nbsp;&nbsp;`/api/v1/tasks/1/completions`

    + Headers

            Accept: text/xml,application/xml,application/xhtml+xml,text/html;q=0.9,text/plain;q=0.8,image/png,*/*;q=0.5
            Content-Type: application/x-www-form-urlencoded

+ Response 200

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "data": {
                "id": "1",
                "type": "task",
                "attributes": {
                  "name": "et",
                  "deadline": null,
                  "position": 1,
                  "completed": true
                },
                "relationships": {
                  "project": {
                    "data": {
                      "id": "2",
                      "type": "project"
                    }
                  },
                  "comments": {
                    "data": [
            
                    ]
                  }
                }
              }
            }

+ Request when not_found
**PATCH**&nbsp;&nbsp;`/api/v1/tasks/888/completions`

    + Headers

            Accept: text/xml,application/xml,application/xhtml+xml,text/html;q=0.9,text/plain;q=0.8,image/png,*/*;q=0.5
            Content-Type: application/x-www-form-urlencoded

+ Response 404

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "errors": "Couldn't find Task with 'id'=888"
            }

### Update postition of a task [PATCH /api/v1/tasks/{task_id}/prioritizations]

+ Parameters
    + task_id: `50` (integer, required)
    + position: `4` (integer, required)

+ Request success
**PATCH**&nbsp;&nbsp;`/api/v1/tasks/1/prioritizations`

    + Headers

            Accept: text/xml,application/xml,application/xhtml+xml,text/html;q=0.9,text/plain;q=0.8,image/png,*/*;q=0.5
            Content-Type: application/x-www-form-urlencoded

    + Body

            task[position]=4

+ Response 200

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "data": {
                "id": "1",
                "type": "task",
                "attributes": {
                  "name": "veritatis",
                  "deadline": null,
                  "position": 4,
                  "completed": false
                },
                "relationships": {
                  "project": {
                    "data": {
                      "id": "2",
                      "type": "project"
                    }
                  },
                  "comments": {
                    "data": [
            
                    ]
                  }
                }
              }
            }

+ Request when not_found
**PATCH**&nbsp;&nbsp;`/api/v1/tasks/888/prioritizations`

    + Headers

            Accept: text/xml,application/xml,application/xhtml+xml,text/html;q=0.9,text/plain;q=0.8,image/png,*/*;q=0.5
            Content-Type: application/x-www-form-urlencoded

    + Body

            task[position]=4

+ Response 404

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "errors": "Couldn't find Task with 'id'=888"
            }

### Get all tasks [GET /api/v1/projects/{project_id}/tasks]

+ Parameters
    + project_id: `2` (number, required)

+ Request success
**GET**&nbsp;&nbsp;`/api/v1/projects/2/tasks`

    + Headers

            Accept: text/xml,application/xml,application/xhtml+xml,text/html;q=0.9,text/plain;q=0.8,image/png,*/*;q=0.5

+ Response 200

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "data": [
                {
                  "id": "1",
                  "type": "task",
                  "attributes": {
                    "name": "ducimus",
                    "deadline": null,
                    "position": 2,
                    "completed": false
                  },
                  "relationships": {
                    "project": {
                      "data": {
                        "id": "2",
                        "type": "project"
                      }
                    },
                    "comments": {
                      "data": [
            
                      ]
                    }
                  }
                }
              ]
            }

### Show task [GET /api/v1/tasks/{id}]

+ Parameters
    + id: `2` (number, required)

+ Request success
**GET**&nbsp;&nbsp;`/api/v1/tasks/2`

    + Headers

            Accept: text/xml,application/xml,application/xhtml+xml,text/html;q=0.9,text/plain;q=0.8,image/png,*/*;q=0.5

+ Response 200

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "data": {
                "id": "2",
                "type": "task",
                "attributes": {
                  "name": "nostrum",
                  "deadline": null,
                  "position": 2,
                  "completed": false
                },
                "relationships": {
                  "project": {
                    "data": {
                      "id": "4",
                      "type": "project"
                    }
                  },
                  "comments": {
                    "data": [
            
                    ]
                  }
                }
              }
            }

+ Request not_found
**GET**&nbsp;&nbsp;`/api/v1/tasks/888`

    + Headers

            Accept: text/xml,application/xml,application/xhtml+xml,text/html;q=0.9,text/plain;q=0.8,image/png,*/*;q=0.5

+ Response 404

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "errors": "Couldn't find Task with 'id'=888"
            }

### Create a task [POST /api/v1/projects/{project_id}/tasks]

+ Parameters
    + project_id: `50` (integer, required)
    + name: `fugiatconsequuntur` (string, required)

+ Request success
**POST**&nbsp;&nbsp;`/api/v1/projects/8/tasks`

    + Headers

            Accept: text/xml,application/xml,application/xhtml+xml,text/html;q=0.9,text/plain;q=0.8,image/png,*/*;q=0.5
            Content-Type: application/x-www-form-urlencoded

    + Body

            task[name]=nullavel

+ Response 201

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "data": {
                "id": "5",
                "type": "task",
                "attributes": {
                  "name": "nullavel",
                  "deadline": null,
                  "position": 2,
                  "completed": false
                },
                "relationships": {
                  "project": {
                    "data": {
                      "id": "8",
                      "type": "project"
                    }
                  },
                  "comments": {
                    "data": [
            
                    ]
                  }
                }
              }
            }

+ Request unprocessable
**POST**&nbsp;&nbsp;`/api/v1/projects/10/tasks`

    + Headers

            Accept: text/xml,application/xml,application/xhtml+xml,text/html;q=0.9,text/plain;q=0.8,image/png,*/*;q=0.5
            Content-Type: application/x-www-form-urlencoded

    + Body

            task[name]

+ Response 422

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "errors": {
                "name": [
                  "can't be blank"
                ]
              }
            }

### Update the task [PUT /api/v1/tasks/{id}]

+ Parameters
    + id: `50` (integer, required)
    + name: `suntet` (string, required)
    + deadline: `2019-09-04+11%3A36%3A07+UTC` (datetime, optional)

+ Request success
**PUT**&nbsp;&nbsp;`/api/v1/tasks/7`

    + Headers

            Accept: text/xml,application/xml,application/xhtml+xml,text/html;q=0.9,text/plain;q=0.8,image/png,*/*;q=0.5
            Content-Type: application/x-www-form-urlencoded

    + Body

            task[name]=consecteturvel&task[deadline]=2019-09-04

+ Response 200

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "data": {
                "id": "7",
                "type": "task",
                "attributes": {
                  "name": "consecteturvel",
                  "deadline": "2019-09-04",
                  "position": 2,
                  "completed": false
                },
                "relationships": {
                  "project": {
                    "data": {
                      "id": "12",
                      "type": "project"
                    }
                  },
                  "comments": {
                    "data": [
            
                    ]
                  }
                }
              }
            }

+ Request unprocessable
**PUT**&nbsp;&nbsp;`/api/v1/tasks/8`

    + Headers

            Accept: text/xml,application/xml,application/xhtml+xml,text/html;q=0.9,text/plain;q=0.8,image/png,*/*;q=0.5
            Content-Type: application/x-www-form-urlencoded

    + Body

            task[name]&task[deadline]=2019-08-21

+ Response 422

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "errors": {
                "name": [
                  "can't be blank"
                ],
                "deadline": [
                  "Can't be in the past"
                ]
              }
            }

+ Request when not_found
**PUT**&nbsp;&nbsp;`/api/v1/tasks/888`

    + Headers

            Accept: text/xml,application/xml,application/xhtml+xml,text/html;q=0.9,text/plain;q=0.8,image/png,*/*;q=0.5
            Content-Type: application/x-www-form-urlencoded

    + Body

            task[name]=impeditqui&task[deadline]=2019-09-04

+ Response 404

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "errors": "Couldn't find Task with 'id'=888"
            }

### Destroy task [DELETE /api/v1/tasks/{id}]

+ Parameters
    + id: `10` (number, required)

+ Request when success
**DELETE**&nbsp;&nbsp;`/api/v1/tasks/10`

    + Headers

            Accept: text/xml,application/xml,application/xhtml+xml,text/html;q=0.9,text/plain;q=0.8,image/png,*/*;q=0.5
            Content-Type: application/x-www-form-urlencoded

+ Response 204

+ Request when not_found
**DELETE**&nbsp;&nbsp;`/api/v1/tasks/888`

    + Headers

            Accept: text/xml,application/xml,application/xhtml+xml,text/html;q=0.9,text/plain;q=0.8,image/png,*/*;q=0.5
            Content-Type: application/x-www-form-urlencoded

+ Response 404

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "errors": "Couldn't find Task with 'id'=888"
            }
