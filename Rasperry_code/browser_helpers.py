# Copyright (C) 2018 Google Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

import os
import tempfile
import webbrowser

ASSISTANT_HTML_FILE = 'google-assistant-sdk-screen-out.html'


class SystemBrowser(object):
    def __init__(self):
        self.tempdir = os.getcwd()
        self.filename = os.path.join(self.tempdir, ASSISTANT_HTML_FILE)     

    def display(self, html):
        with open(self.filename, 'wb+') as f:
            f.write(html)
        #tmp = webbrowser.open_new(self.filename)


system_browser = SystemBrowser()
