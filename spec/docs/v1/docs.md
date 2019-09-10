

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
            
              ]
            }

### Create a comment [POST /api/v1/tasks/{task_id}/comments]

+ Parameters
    + task_id: `4` (number, required)

+ Request success
**POST**&nbsp;&nbsp;`/api/v1/tasks/4/comments`

    + Headers

            Accept: text/xml,application/xml,application/xhtml+xml,text/html;q=0.9,text/plain;q=0.8,image/png,*/*;q=0.5
            Content-Type: application/x-www-form-urlencoded

    + Body

            comment[body]=quivoluptatemsapientedelectusveniamsaepeipsumvelsimiliqueaut

+ Response 201

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "data": {
                "id": "4",
                "type": "comment",
                "attributes": {
                  "body": "ipsamadsedundeaut",
                  "image": {
                    "name": "image",
                    "record": {
                      "task_id": 4,
                      "body": "ipsamadsedundeaut",
                      "id": 4,
                      "created_at": "2019-09-10T10:02:18.682Z",
                      "updated_at": "2019-09-10T10:02:18.684Z"
                    },
                    "dependent": "purge_later"
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
                "comments.body": [
                  "is too short (minimum is 10 characters)"
                ]
              }
            }

### Destroy the comment [DELETE /api/v1/comments/{id}]

+ Parameters
    + id: `7` (number, required)

+ Request success
**DELETE**&nbsp;&nbsp;`/api/v1/comments/7`

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

            Content-Type: text/html

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
                    "name": "culpa"
                  },
                  "relationships": {
                    "user": {
                      "data": {
                        "id": "6",
                        "type": "user"
                      }
                    },
                    "tasks": {
                      "data": [
            
                      ]
                    }
                  }
                },
                {
                  "id": "2",
                  "type": "project",
                  "attributes": {
                    "name": "facere"
                  },
                  "relationships": {
                    "user": {
                      "data": {
                        "id": "6",
                        "type": "user"
                      }
                    },
                    "tasks": {
                      "data": [
            
                      ]
                    }
                  }
                },
                {
                  "id": "3",
                  "type": "project",
                  "attributes": {
                    "name": "nemo"
                  },
                  "relationships": {
                    "user": {
                      "data": {
                        "id": "6",
                        "type": "user"
                      }
                    },
                    "tasks": {
                      "data": [
            
                      ]
                    }
                  }
                },
                {
                  "id": "4",
                  "type": "project",
                  "attributes": {
                    "name": "consequatur"
                  },
                  "relationships": {
                    "user": {
                      "data": {
                        "id": "6",
                        "type": "user"
                      }
                    },
                    "tasks": {
                      "data": [
            
                      ]
                    }
                  }
                },
                {
                  "id": "5",
                  "type": "project",
                  "attributes": {
                    "name": "molestiae"
                  },
                  "relationships": {
                    "user": {
                      "data": {
                        "id": "6",
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
    + id: `6` (number, required)

+ Request success
**GET**&nbsp;&nbsp;`/api/v1/projects/6`

    + Headers

            Accept: text/xml,application/xml,application/xhtml+xml,text/html;q=0.9,text/plain;q=0.8,image/png,*/*;q=0.5

+ Response 200

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "data": {
                "id": "6",
                "type": "project",
                "attributes": {
                  "name": "esse"
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

+ Request not_found
**GET**&nbsp;&nbsp;`/api/v1/projects/999`

    + Headers

            Accept: text/xml,application/xml,application/xhtml+xml,text/html;q=0.9,text/plain;q=0.8,image/png,*/*;q=0.5

+ Response 404

    + Headers

            Content-Type: text/html

### Create a project [POST /api/v1/projects]


+ Request created
**POST**&nbsp;&nbsp;`/api/v1/projects`

    + Headers

            Accept: text/xml,application/xml,application/xhtml+xml,text/html;q=0.9,text/plain;q=0.8,image/png,*/*;q=0.5
            Content-Type: application/x-www-form-urlencoded

    + Body

            project[name]=laudantiumfugiat

+ Response 201

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "data": {
                "id": "21",
                "type": "project",
                "attributes": {
                  "name": "laudantiumfugiat"
                },
                "relationships": {
                  "user": {
                    "data": {
                      "id": "24",
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

+ Request bad_request
**POST**&nbsp;&nbsp;`/api/v1/projects`

    + Headers

            Accept: text/xml,application/xml,application/xhtml+xml,text/html;q=0.9,text/plain;q=0.8,image/png,*/*;q=0.5
            Content-Type: application/x-www-form-urlencoded

    + Body

            name=consequaturfugiat

+ Response 400

    + Headers

            Content-Type: text/html

### Update the project [PATCH /api/v1/projects/{id}]

+ Parameters
    + id: `32` (number, required)

+ Request success
**PATCH**&nbsp;&nbsp;`/api/v1/projects/32`

    + Headers

            Accept: text/xml,application/xml,application/xhtml+xml,text/html;q=0.9,text/plain;q=0.8,image/png,*/*;q=0.5
            Content-Type: application/x-www-form-urlencoded

    + Body

            project[name]=adipiscicorrupti

+ Response 200

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "data": {
                "id": "32",
                "type": "project",
                "attributes": {
                  "name": "adipiscicorrupti"
                },
                "relationships": {
                  "user": {
                    "data": {
                      "id": "42",
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
**PATCH**&nbsp;&nbsp;`/api/v1/projects/37`

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
    + id: `42` (number, required)

+ Request success
**DELETE**&nbsp;&nbsp;`/api/v1/projects/42`

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

            Content-Type: text/html

###  [DELETE /api/v1/projects/{id}]

+ Parameters
    + id: `52` (number, required)

+ Request success
**DELETE**&nbsp;&nbsp;`/api/v1/projects/52`

    + Headers

            Accept: text/xml,application/xml,application/xhtml+xml,text/html;q=0.9,text/plain;q=0.8,image/png,*/*;q=0.5
            Content-Type: application/x-www-form-urlencoded

+ Response 403

    + Headers

            Content-Type: text/html

# Group Registrations


## Registrations [/registrations]


### Create user [POST /api/v1/auth/registrations]


+ Request created
**POST**&nbsp;&nbsp;`/api/v1/auth/registrations`

    + Headers

            Accept: text/xml,application/xml,application/xhtml+xml,text/html;q=0.9,text/plain;q=0.8,image/png,*/*;q=0.5
            Content-Type: application/x-www-form-urlencoded

    + Body

            user[username]=loyd_sipes&user[password]=RfUYZ8u7lZgH&user[password_confirmation]=RfUYZ8u7lZgH

+ Response 201

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "csrf": "pDNuj+cm00KTWmwnjrDj7MA+3sDJNFylH6XgVOeiET9EppDMixsfSVfZYMZiBOHuBODEsFTMM2oaFcPZmsjQVA=="
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
                "username": [
                  "can't be blank",
                  "is too short (minimum is 3 characters)"
                ],
                "password": [
                  "can't be blank",
                  "is too short (minimum is 8 characters)"
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
              "csrf": "iLzNxQEa95h5fSayBrfBjaOiqwTIquDl0Qc40RULzmQ6Zinml0yjh4s0MHQsY6vUOHONrBxGY1Ir/loWky6gXg=="
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


+ Request success
**POST**&nbsp;&nbsp;`/api/v1/auth/sessions`

    + Headers

            Accept: text/xml,application/xml,application/xhtml+xml,text/html;q=0.9,text/plain;q=0.8,image/png,*/*;q=0.5
            Content-Type: application/x-www-form-urlencoded

    + Body

            username=bree&password=RfUYZ8u7lZgH

+ Response 200

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "csrf": "yc11KJHhLm/90BDVu3Hsd39CxOVt5dGDmnh7PyarfXLweHopvgRUuxTom74lq8gc0XNbtbCLxvFqnuZ26H03DQ=="
            }

+ Request not_found
**POST**&nbsp;&nbsp;`/api/v1/auth/sessions`

    + Headers

            Accept: text/xml,application/xml,application/xhtml+xml,text/html;q=0.9,text/plain;q=0.8,image/png,*/*;q=0.5
            Content-Type: application/x-www-form-urlencoded

    + Body

            username=qynue&password=RfUYZ8u7lZgH

+ Response 404

    + Headers

            Content-Type: text/html

+ Request unauthorized
**POST**&nbsp;&nbsp;`/api/v1/auth/sessions`

    + Headers

            Accept: text/xml,application/xml,application/xhtml+xml,text/html;q=0.9,text/plain;q=0.8,image/png,*/*;q=0.5
            Content-Type: application/x-www-form-urlencoded

    + Body

            username=ervin_marks&password=

+ Response 401

    + Headers

            Content-Type: text/html

### Destroy session [DELETE /api/v1/auth/sessions]


+ Request no_content
**DELETE**&nbsp;&nbsp;`/api/v1/auth/sessions`

    + Headers

            Accept: text/xml,application/xml,application/xhtml+xml,text/html;q=0.9,text/plain;q=0.8,image/png,*/*;q=0.5
            Content-Type: application/x-www-form-urlencoded

+ Response 204

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
                  "name": "accusamus",
                  "deadline": null,
                  "position": 2,
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

            Content-Type: text/html

### Update postition of a task [PATCH /api/v1/tasks/{task_id}/prioritizations]

+ Parameters
    + task_id: `1` (number, required)

+ Request success
**PATCH**&nbsp;&nbsp;`/api/v1/tasks/1/prioritizations`

    + Headers

            Accept: text/xml,application/xml,application/xhtml+xml,text/html;q=0.9,text/plain;q=0.8,image/png,*/*;q=0.5
            Content-Type: application/x-www-form-urlencoded

    + Body

            task[position]=5

+ Response 200

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "data": {
                "id": "1",
                "type": "task",
                "attributes": {
                  "name": "ipsa",
                  "deadline": null,
                  "position": 5,
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

            task[position]=1

+ Response 404

    + Headers

            Content-Type: text/html

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
                    "name": "non",
                    "deadline": null,
                    "position": 1,
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
                  "name": "minima",
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

            Content-Type: text/html

### Create a task [POST /api/v1/projects/{project_id}/tasks]

+ Parameters
    + project_id: `8` (number, required)

+ Request success
**POST**&nbsp;&nbsp;`/api/v1/projects/8/tasks`

    + Headers

            Accept: text/xml,application/xml,application/xhtml+xml,text/html;q=0.9,text/plain;q=0.8,image/png,*/*;q=0.5
            Content-Type: application/x-www-form-urlencoded

    + Body

            task[name]=officiisat

+ Response 201

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "data": {
                "id": "5",
                "type": "task",
                "attributes": {
                  "name": "officiisat",
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

### Update the task [PATCH /api/v1/tasks/{id}]

+ Parameters
    + id: `7` (number, required)

+ Request success
**PATCH**&nbsp;&nbsp;`/api/v1/tasks/7`

    + Headers

            Accept: text/xml,application/xml,application/xhtml+xml,text/html;q=0.9,text/plain;q=0.8,image/png,*/*;q=0.5
            Content-Type: application/x-www-form-urlencoded

    + Body

            task[name]=utalias

+ Response 200

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "data": {
                "id": "7",
                "type": "task",
                "attributes": {
                  "name": "utalias",
                  "deadline": null,
                  "position": 1,
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

+ Request success
**PATCH**&nbsp;&nbsp;`/api/v1/tasks/8`

    + Headers

            Accept: text/xml,application/xml,application/xhtml+xml,text/html;q=0.9,text/plain;q=0.8,image/png,*/*;q=0.5
            Content-Type: application/x-www-form-urlencoded

    + Body

            task[deadline]=2019-09-17

+ Response 200

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "data": {
                "id": "8",
                "type": "task",
                "attributes": {
                  "name": "nulla",
                  "deadline": "2019-09-17",
                  "position": 1,
                  "completed": false
                },
                "relationships": {
                  "project": {
                    "data": {
                      "id": "14",
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
**PATCH**&nbsp;&nbsp;`/api/v1/tasks/9`

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

+ Request unprocessable
**PATCH**&nbsp;&nbsp;`/api/v1/tasks/10`

    + Headers

            Accept: text/xml,application/xml,application/xhtml+xml,text/html;q=0.9,text/plain;q=0.8,image/png,*/*;q=0.5
            Content-Type: application/x-www-form-urlencoded

    + Body

            task[deadline]=2019-09-03

+ Response 422

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "errors": {
                "deadline": [
                  "Can't be in the past"
                ]
              }
            }

+ Request when not_found
**PATCH**&nbsp;&nbsp;`/api/v1/tasks/888`

    + Headers

            Accept: text/xml,application/xml,application/xhtml+xml,text/html;q=0.9,text/plain;q=0.8,image/png,*/*;q=0.5
            Content-Type: application/x-www-form-urlencoded

    + Body

            task[name]=delectuset&task[deadline]=2019-09-17

+ Response 404

    + Headers

            Content-Type: text/html

### Destroy task [DELETE /api/v1/tasks/{id}]

+ Parameters
    + id: `12` (number, required)

+ Request when success
**DELETE**&nbsp;&nbsp;`/api/v1/tasks/12`

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

            Content-Type: text/html
